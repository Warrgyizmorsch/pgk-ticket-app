import 'dart:async';
import 'package:network_info_plus/network_info_plus.dart';
import '../../../common/constant/app_imports.dart';
import '../../../core/models/network_model/network_list_response.dart';
import '../../../core/utils/api/network_api/network_list_api.dart';
import '../../../core/utils/api/scanner_api/get_scanner_api.dart';
import '../widget/visitor_web_view_screen.dart';
import 'dart:io' show Platform;
class ScannerController extends GetxController {
  // ─── Scanner & Gallery Variables ───
  final MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
  );
  final ImagePicker _picker = ImagePicker();

  var isCheckingNetwork = true.obs;
  var isAuthorizedNetwork = false.obs;

  final Set<String> _allowedIps = {};

  // ⬅️ NEW: Timer to continuously monitor network changes
  Timer? _networkMonitorTimer;

  final RxString scannedText = 'Scan a QR code to see the result here.'.obs;
  bool _isFetching = false;
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;
  final RxDouble audioProgress = 0.0.obs;

  WebViewController? webController;
  final RxBool isWebLoading = true.obs;
  final RxDouble webViewHeight = 1000.0.obs;

  VideoPlayerController? videoController;
  final RxBool isVideoPlaying = false.obs;
  final RxBool isVideoLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    verifyWifiConnection();     // Initial check with loading UI
    _startNetworkMonitoring();
  }

  // ─── Network Methods ───

  Future<void> fetchAllowedNetworks() async {
    try {
      final NetworkListResponseModel response = await NetworkApiService.getNetworkList();
      final activeNetworks = response.data?.where((item) => item.status == true).toList() ?? [];
      _allowedIps.clear();
      for (var item in activeNetworks) {
        if (item.publicIp != null && item.publicIp!.trim().isNotEmpty) {
          _allowedIps.add(item.publicIp!.trim());
        }
        if (item.privateIp != null && item.privateIp!.trim().isNotEmpty) {
          _allowedIps.add(item.privateIp!.trim());
        }
      }
      debugPrint("Allowed IPs loaded: $_allowedIps");
    } catch (e) {
      debugPrint("Failed to fetch allowed networks: $e");
    }
  }

  bool _isIpAuthorized(String? wifiIP) {
    if (wifiIP == null || wifiIP.isEmpty) return false;
    return _allowedIps.any((allowedIp) => wifiIP == allowedIp || wifiIP.startsWith(allowedIp));
  }

  Future<void> verifyWifiConnection() async {
    isCheckingNetwork.value = true;
    try {
      await fetchAllowedNetworks();
      final info = NetworkInfo();
      final wifiIP = await info.getWifiIP();
      debugPrint("Initial Wifi Ip: $wifiIP");

      if (_isIpAuthorized(wifiIP)) {
        isAuthorizedNetwork.value = true;
      } else {
        isAuthorizedNetwork.value = false;
      }
    } catch (e) {
      isAuthorizedNetwork.value = false;
    } finally {
      isCheckingNetwork.value = false;
    }
  }

  // ⬅️ NEW: Silent background monitoring
  void _startNetworkMonitoring() {
    int counter = 0;
    // Checks the IP address every 3 seconds.
    _networkMonitorTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        counter++;
        // Refresh network list every 30 seconds (10 ticks of 3s)
        if (counter >= 10 || _allowedIps.isEmpty) {
          counter = 0;
          await fetchAllowedNetworks();
        }

        final info = NetworkInfo();
        final wifiIP = await info.getWifiIP();

        if (_isIpAuthorized(wifiIP)) {
          if (!isAuthorizedNetwork.value) {
            isAuthorizedNetwork.value = true;
            scannerController.start(); // Restart camera if connection is restored
            debugPrint("Wifi Restored: $wifiIP");
          }
        } else {
          if (isAuthorizedNetwork.value) {
            isAuthorizedNetwork.value = false;
            scannerController.stop(); // Stop camera to save battery when unauthorized
            debugPrint("Wifi Lost or Changed: Access Denied");
          }
        }
      } catch (e) {
        isAuthorizedNetwork.value = false;
      }
    });
  }

  // ─── Narration & Media Methods ───

  Future<void> toggleNarration(String textToRead) async {
    if (isPlaying.value) {
      await flutterTts.pause();
      isPlaying.value = false;
    } else {
      String currentLang = Get.locale?.languageCode ?? 'en';
      if (currentLang == 'hi') {
        await flutterTts.setLanguage("hi-IN");
      } else if (currentLang == 'gu') {
        await flutterTts.setLanguage("gu-IN");
      } else {
        await flutterTts.setLanguage("en-US");
      }
      await flutterTts.setSpeechRate(0.5);
      isPlaying.value = true;
      await flutterTts.speak(textToRead);
    }
  }

  void setupWebView(String url) {
    isWebLoading.value = true;
    webViewHeight.value = 1000.0;

    String currentLang = Get.locale?.languageCode ?? 'en';

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFF6F0))
      ..addJavaScriptChannel(
        'HeightObserver',
        onMessageReceived: (JavaScriptMessage message) {
          double? height = double.tryParse(message.message);
          if (height != null) {
            webViewHeight.value = height ;
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) => isWebLoading.value = true,
          onPageFinished: (String url) {
            isWebLoading.value = false;
            webController?.runJavaScript(
                'setTimeout(() => HeightObserver.postMessage(document.documentElement.scrollHeight.toString()), 500);'
            );
            // ... (Your existing JS injection logic remains unchanged)
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  void initializeAndPlayVideo(String videoUrl) {
    isVideoPlaying.value = true;
    isVideoLoading.value = true;

    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        isVideoLoading.value = false;
        videoController!.play();
      }).catchError((error) {
        debugPrint("Video Error: $error");
        isVideoLoading.value = false;
        isVideoPlaying.value = false;
      });
  }

  void cleanupMedia() {
    videoController?.dispose();
    videoController = null;
    webController = null;
    isVideoPlaying.value = false;
    isVideoLoading.value = false;
    isWebLoading.value = true;
    webViewHeight.value = 100.0;
  }

  // ─── Scanner Methods ───

  Future<void> onDetect(BarcodeCapture capture) async {
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      if (barcode.rawValue != null && !_isFetching) {
        final scannedUrl = barcode.rawValue!;
        scannedText.value = scannedUrl;
        debugPrint('QR Code Scanned: $scannedUrl');

        if (scannedUrl.startsWith('http')) {
          await _fetchVisitData(scannedUrl);
        }
        break;
      }
    }
  }

  Future<void> _fetchVisitData(String apiUrl) async {
    _isFetching = true;

    Get.dialog(
      const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      barrierDismissible: false,
    );

    try {
      final responseModel = await VisitApiService.getScanner(getUrl: apiUrl);
      if (Get.isDialogOpen ?? false) Get.back();

      if (responseModel.success == true) {
        final String finalUrl = responseModel.data?.publicUrl ?? "";

        if (finalUrl.isNotEmpty) {
          await scannerController.stop();

          setupWebView(finalUrl);

          await Get.to(
                () => VisitorWebViewScreen(
              title: responseModel.data?.title,
              thumbnailUrl: responseModel.data?.thumbnailUrl,
              videoUrl: responseModel.data?.videoUrl,
              faqs: responseModel.data?.faqs,
            ),
          );

          cleanupMedia();
          scannedText.value = 'Scan a QR code to see the result here.';
          _isFetching = false;

          // Only restart the scanner if we are still authorized!
          if (isAuthorizedNetwork.value) {
            await scannerController.start();
          }
        } else {
          CustomSnackbar.showSnackbar('Error', 'Public URL not found in response.', AppColors.error);
          _isFetching = false;
        }
      } else {
        CustomSnackbar.showSnackbar('Error', responseModel.message ?? 'Failed to load content.', AppColors.error);
        _isFetching = false;
      }
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      CustomSnackbar.showSnackbar('Error', 'Failed to fetch data. Please try again.', AppColors.error);
      debugPrint('API Error: $e');
      _isFetching = false;
    }
  }

  void toggleFlash() {
    scannerController.toggleTorch();
  }

  Future<void> scanFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final BarcodeCapture? capture = await scannerController.analyzeImage(image.path);
      if (capture == null || capture.barcodes.isEmpty) {
        CustomSnackbar.showSnackbar('Error', 'No QR code found in the image.', AppColors.error);
      } else {
        onDetect(capture);
      }
    }
  }

  @override
  void onClose() {
    _networkMonitorTimer?.cancel(); // ⬅️ NEW: Prevent memory leaks
    scannerController.dispose();
    cleanupMedia();
    flutterTts.stop();
    super.onClose();
  }
}