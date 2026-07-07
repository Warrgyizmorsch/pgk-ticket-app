import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart'; // <-- ADDED THIS IMPORT

import '../widget/payment_succes_view.dart';

class PaymentController extends GetxController {
  // ─── Core Payment State ───
  final RxDouble totalAmount = 0.0.obs;
  final RxString selectedPaymentMethod = ''.obs;
  final RxString selectedBank = ''.obs;
  final RxString selectedWallet = ''.obs;
  final RxBool isProcessing = false.obs;

  // ─── Reactive Receipt Data Fields ───
  final RxString orderId = ''.obs;
  final RxString bookingDate = ''.obs;
  final RxString customerName = ''.obs;
  final RxString customerEmail = ''.obs;
  final RxString customerPhone = ''.obs;
  final RxList<Map<String, dynamic>> tickets = <Map<String, dynamic>>[].obs;

  // ─── Dummy Data for Intent Testing ───
  final String dummyUpiId = "testmerchant@upi";
  final String dummyMerchantName = "Test Booking Merchant";

  @override
  void onInit() {
    super.onInit();

    // Extract packaged data from BookingController arguments
    if (Get.arguments != null) {
      final Map<String, dynamic> data = Get.arguments;

      totalAmount.value = data['amount'] ?? 1.00;
      customerName.value = data['customerName'] ?? 'Unknown';
      customerEmail.value = data['customerEmail'] ?? 'N/A';
      customerPhone.value = data['customerPhone'] ?? 'N/A';
      bookingDate.value = data['bookingDate'] ?? '';

      // Generate a unique dummy Order ID for presentation
      orderId.value = 'Order_${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}';

      if (data['tickets'] != null) {
        tickets.assignAll(List<Map<String, dynamic>>.from(data['tickets']));
      }
    } else {
      totalAmount.value = 1.00; // Fallback
    }
  }

  // ─── Grand Total Getter ───
  double get grandTotal {
    return tickets.fold(0.0, (sum, item) => sum + (item['total'] as num).toDouble());
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
    if (method != 'NET_BANKING') selectedBank.value = '';
    if (method != 'WALLET') selectedWallet.value = '';
  }

  void selectBank(String bank) {
    selectedBank.value = bank;
  }

  void selectWallet(String wallet) {
    selectedWallet.value = wallet;
  }

  // ─── Payment Execution Router ───
  Future<void> processPayment() async {
    if (selectedPaymentMethod.value.isEmpty) {
      Get.snackbar('Action Required', 'Please select a payment method.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (totalAmount.value <= 0) {
      Get.snackbar('Error', 'Invalid payment amount.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (selectedPaymentMethod.value == 'NET_BANKING' && selectedBank.value.isEmpty) {
      Get.snackbar('Action Required', 'Please select a bank to proceed.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (selectedPaymentMethod.value == 'WALLET' && selectedWallet.value.isEmpty) {
      Get.snackbar('Action Required', 'Please select a wallet to proceed.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (selectedPaymentMethod.value == 'UPI') {
      await _launchUpiIntent();
    } else if (selectedPaymentMethod.value == 'NET_BANKING') {
      await _processNetBankingPayment();
    } else if (selectedPaymentMethod.value == 'WALLET') {
      await _processWalletPayment();
    } else {
      await _processStandardPayment();
    }
  }

  Future<void> _launchUpiIntent() async {
    final String amountString = totalAmount.value.toStringAsFixed(2);
    final Uri upiUri = Uri.parse(
        'upi://pay?pa=$dummyUpiId&pn=${Uri.encodeComponent(dummyMerchantName)}&am=$amountString&cu=INR&tn=Ticket Booking'
    );

    isProcessing.value = true;

    try {
      bool launched = await launchUrl(upiUri, mode: LaunchMode.externalApplication);
      if (!launched) {
        Get.snackbar(
          'No UPI App Found',
          'Please install a UPI app like GPay or PhonePe to proceed.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        await Future.delayed(const Duration(seconds: 2));
        _navigateToSuccessScreen();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to open UPI app.');
    } finally {
      isProcessing.value = false;
    }
  }

  Future<void> _processNetBankingPayment() async {
    isProcessing.value = true;
    try {
      _showLoadingDialog('Connecting to ${selectedBank.value}...');
      await Future.delayed(const Duration(seconds: 3));
      if (Get.isDialogOpen ?? false) Get.back();

      _navigateToSuccessScreen();
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar('Failed', 'Transaction interrupted.', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isProcessing.value = false;
    }
  }

  Future<void> _processWalletPayment() async {
    isProcessing.value = true;
    try {
      _showLoadingDialog('Connecting to ${selectedWallet.value}...');
      await Future.delayed(const Duration(seconds: 3));
      if (Get.isDialogOpen ?? false) Get.back();

      _navigateToSuccessScreen();
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar('Failed', 'Transaction interrupted.', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isProcessing.value = false;
    }
  }

  Future<void> _processStandardPayment() async {
    isProcessing.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      _navigateToSuccessScreen();
    } catch (e) {
      Get.snackbar('Failed', 'Payment failed.', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isProcessing.value = false;
    }
  }

  void _navigateToSuccessScreen() {
    // Navigates directly to the success view while keeping the pre-loaded controller arguments alive
    Get.to(() => const PaymentSuccessView(), arguments: Get.arguments);
  }

  void printReceipt() {
    Get.snackbar('Print Status', 'Connecting to available print services...', snackPosition: SnackPosition.BOTTOM);
  }

  // ─── ADDED: Share Receipt Logic ───
  Future<void> shareReceipt() async {
    try {
      // Build a clean, formatted text string of the receipt details
      final StringBuffer receiptText = StringBuffer();

      receiptText.writeln('🎟️ Payment Receipt 🎟️');
      receiptText.writeln('Maharana Pratap Gorurav Kendra');
      receiptText.writeln('-----------------------------------');
      receiptText.writeln('Order ID: ${orderId.value}');
      receiptText.writeln('Date: ${bookingDate.value}');
      receiptText.writeln('Name: ${customerName.value}');
      if (customerPhone.value != 'N/A') {
        receiptText.writeln('Phone: ${customerPhone.value}');
      }
      receiptText.writeln('-----------------------------------');

      // Add Ticket Details
      for (var item in tickets) {
        receiptText.writeln('${item['qty']}x ${item['name']} - ₹${item['total'].toStringAsFixed(2)}');
      }

      receiptText.writeln('-----------------------------------');
      receiptText.writeln('Grand Total: ₹${grandTotal.toStringAsFixed(2)}');
      receiptText.writeln('-----------------------------------');
      receiptText.writeln('Thank you for your visit!');

      // Trigger the native share sheet
      await SharePlus.instance.share(
        ShareParams(
          text: receiptText.toString(),
          subject: 'Payment Receipt - ${orderId.value}',
        ),
      );

    } catch (e) {
      Get.snackbar('Error', 'Failed to share receipt.', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _showLoadingDialog(String message) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(message, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              const Text('Please do not close the app.', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}