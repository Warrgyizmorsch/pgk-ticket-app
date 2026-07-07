
import 'package:intl/intl.dart';

import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_payment_response.dart';
import '../../../core/utils/api/booking_api/payment_api.dart';

class HistoryController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rxn<PaymentResponseModel> paymentResponse = Rxn<PaymentResponseModel>();

  // --- Filter States ---
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String?> selectedStatus = ValueNotifier<String?>(null);
  final RxnString fromDate = RxnString();
  final RxnString toDate = RxnString();

  // Allowed statuses for the dropdown
  final List<String> statuses = ['success', 'pending', 'failed', 'cancelled', 'refunded'];

  @override
  void onInit() {
    super.onInit();
    getPaymentHistory(); // Initial fetch
  }

  // Called when a user types in the search bar or changes a filter
  void applyFilters() {
    int? bookingId;
    if (searchController.text.isNotEmpty) {
      bookingId = int.tryParse(searchController.text);
    }

    getPaymentHistory(
      status: selectedStatus.value,
      bookingId: bookingId,
      fromDate: fromDate.value,
      toDate: toDate.value,
    );
  }

  void clearFilters() {
    searchController.clear();
    selectedStatus.value = null;
    fromDate.value = null;
    toDate.value = null;
    getPaymentHistory(); // Fetch without filters
  }

  void applyFiltersFromDialog() {
    applyFilters();
    Get.back(); // Close the dialog
  }
  Future<void> getPaymentHistory({
    String? status,
    String? perPage = '10',
    int? bookingId,
    String? gateway,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await BookingPayment.paymentHistory(
        status: status,
        perPage: perPage,
        bookingId: bookingId,
        gateway: gateway,
        fromDate: fromDate,
        toDate: toDate,
      );

      paymentResponse.value = response;
    } catch (e) {
      errorMessage.value = 'Failed to load history. Please try again.';
      debugPrint("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // --- Replace selectDateRange with this ---
  Future<void> selectDate(BuildContext context, {required bool isFromDate}) async {
    DateTime initialDate = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020), // Adjust based on your app's needs
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFE75B22), // Matches your provided theme
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Format as YYYY-MM-DD for the API
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      if (isFromDate) {
        fromDate.value = formattedDate;
      } else {
        toDate.value = formattedDate;
      }

      applyFilters(); // Automatically fetch data when a date is picked
    }
  }
}