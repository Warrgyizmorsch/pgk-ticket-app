
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../common/constant/app_imports.dart';

class ScannerController extends GetxController {
  // ─── Scanner & Gallery Variables ───
  final MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
  );
  final ImagePicker _picker = ImagePicker();

  // 👉 NEW: Reactive variable to hold the scanned result
  final RxString scannedText = 'Scan a QR code to see the result here.'.obs;

  // ─── TTS State Variables ───
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isPlaying = false.obs;
  final RxDouble audioProgress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  // ─── TTS Methods ───
  void _initTts() {
    flutterTts.setCompletionHandler(() {
      isPlaying.value = false;
      audioProgress.value = 1.0;
      Future.delayed(
        const Duration(seconds: 1),
            () => audioProgress.value = 0.0,
      );
    });

    flutterTts.setProgressHandler((
        String text,
        int startOffset,
        int endOffset,
        String word,
        ) {
      audioProgress.value = endOffset / text.length;
    });
  }

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

  // ─── Scanner Methods ───
  void onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      if (barcode.rawValue != null) {
        scannedText.value = barcode.rawValue!;

        debugPrint('QR Code Scanned: ${barcode.rawValue}');
      }
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
        Get.snackbar('Error', 'No QR code found in the image.');
      } else {
        onDetect(capture);
      }
    }
  }

  @override
  void onClose() {
    scannerController.dispose();
    flutterTts.stop();
    super.onClose();
  }
}