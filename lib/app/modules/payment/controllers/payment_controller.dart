
import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_list_response.dart';
import '../../../core/utils/api/booking_api/ticket_booking_api.dart';



class PaymentController extends GetxController {
  late final WebViewController webViewController;
  final RxBool isLoading = true.obs;

  final RxBool isVerifyingPayment = false.obs;
  final RxString paymentUrl = ''.obs;

  // --- Receipt Data Fields ---
  final RxDouble totalAmount = 0.0.obs;
  final RxString orderId = ''.obs;
  final RxString bookingDate = ''.obs;
  final RxString customerName = ''.obs;
  final RxString customerPhone = ''.obs;

  // 👉 CHANGED to PriceBreakdownModel
  final Rx<PriceBreakdownModel?> priceBreakdown = Rx<PriceBreakdownModel?>(null);

  @override
  void onInit() {
    super.onInit();

    // Extract packaged data from previous screen
    if (Get.arguments != null) {
      final Map<String, dynamic> data = Get.arguments;

      paymentUrl.value = data['paymentUrl'] ?? '';
      totalAmount.value = (data['amount'] ?? 0.0).toDouble();
      customerName.value = data['customerName'] ?? 'Unknown';
      customerPhone.value = data['customerPhone'] ?? 'N/A';
      bookingDate.value = data['bookingDate'] ?? '';
      orderId.value = data['bookingId']?.toString() ?? 'Order_${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}';

      // 👉 Map the new PriceBreakdownModel
      if (data['tickets'] != null) {
        if (data['tickets'] is PriceBreakdownModel) {
          priceBreakdown.value = data['tickets'];
        }
      }
    }

    _initializeWebView();
  }

  void _initializeWebView() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isLoading.value = true;
            debugPrint("WebView Started Loading: $url");
          },
          onPageFinished: (String url) {
            isLoading.value = false;
            debugPrint("WebView Finished Loading: $url");
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint("Navigating to: ${request.url}");

            // --- INTERCEPT SUCCESS/FAILURE CALLBACKS ---
            if (request.url.contains('api/payment/callback') || request.url.contains('success')) {
              _verifyPaymentStatus();
              return NavigationDecision.prevent;

            } else if (request.url.contains('failed') || request.url.contains('cancel')) {
              Get.snackbar(
                'Payment Failed',
                'Your transaction was cancelled or failed.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
              Get.back(); // Take them back to the booking screen
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      );

    if (paymentUrl.value.isNotEmpty) {
      webViewController.loadRequest(Uri.parse(paymentUrl.value));
    } else {
      Get.snackbar('Error', 'Payment URL is missing.', snackPosition: SnackPosition.BOTTOM);
    }
  }
  Future<void> _verifyPaymentStatus() async {
    try {
      isVerifyingPayment.value = true;

      await Future.delayed(const Duration(seconds: 3));

      // Fetch the latest bookings
      final response = await TicketBooking.ticketBookingList(
        perPage: 50,
      );

      if (response.success) {
        final currentBookingIdStr = orderId.value;

        final matches = response.data.where(
              (booking) => booking.bookingId.toString() == currentBookingIdStr,
        );

        final currentBooking = matches.isNotEmpty ? matches.first : null;

        if (currentBooking != null) {
          final String status = currentBooking.paymentStatus.value.toLowerCase();
          debugPrint("Status: $status");
          if (status == 'success') {
            Get.to(() => const PaymentSuccessView(), arguments: Get.arguments);
          } else {
            // Payment is still pending or failed
            Get.snackbar(
              'Payment Status Pending',
              'Your payment is being processed. Please check your tickets shortly.',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 4),
            );
            Get.until((route) => route.settings.name == Routes.NAV_BAR);
            Get.find<NavBarController>().changeTab(5);
          }
        } else {
          Get.snackbar('Notice', 'Payment processed. Refresh your tickets to see the update.');
          Get.back();
        }
      } else {
        Get.snackbar('Verification Error', response.message);
        Get.back();
      }
    } catch (e) {
      debugPrint('Verification Error: $e');
      Get.snackbar(
        'Notice',
        'Please check your My Tickets tab for updated status.',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.back();
    } finally {
      isVerifyingPayment.value = false;
    }
  }
  Future<void> shareReceipt() async {
    try {
      final StringBuffer receiptText = StringBuffer();
      receiptText.writeln('🎟️ Payment Receipt 🎟️');
      receiptText.writeln('Maharana Pratap Gaurav Kendra');
      receiptText.writeln('-----------------------------------');
      receiptText.writeln('Order ID: ${orderId.value}');
      receiptText.writeln('Date: ${bookingDate.value}');
      receiptText.writeln('Name: ${customerName.value}');

      if (customerPhone.value != 'N/A' && customerPhone.value.isNotEmpty) {
        receiptText.writeln('Phone: ${customerPhone.value}');
      }

      receiptText.writeln('-----------------------------------');

      // 👉 UPDATED: Read quantities from the PriceBreakdownModel
      final breakdown = priceBreakdown.value;
      if (breakdown != null) {
        if (breakdown.adults != null && breakdown.adults!.count > 0) {
          receiptText.writeln('${breakdown.adults!.count} x Adults');
        }
        if (breakdown.kids != null && breakdown.kids!.count > 0) {
          receiptText.writeln('${breakdown.kids!.count} x Kids');
        }
        if (breakdown.infants != null && breakdown.infants!.count > 0) {
          receiptText.writeln('${breakdown.infants!.count} x Infants');
        }
      }

      receiptText.writeln('-----------------------------------');
      receiptText.writeln('Grand Total: ₹${totalAmount.value.toStringAsFixed(2)}');
      receiptText.writeln('-----------------------------------');
      receiptText.writeln('Thank you for your visit!');

      await SharePlus.instance.share(
        ShareParams(
          text: receiptText.toString(),
          subject: 'Payment Receipt - ${orderId.value}',
        ),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to share receipt: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }
}