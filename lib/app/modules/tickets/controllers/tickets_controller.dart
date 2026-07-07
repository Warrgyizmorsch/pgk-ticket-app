import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_list_response.dart';
import '../../../core/models/login_model/otp_verification_response_model.dart';
import '../../../core/utils/api/booking_api/ticket_booking_api.dart';
import '../../../services/storage_services.dart';

class TicketsController extends GetxController {


  // 1. Set up your reactive variables at the top of your controller
  final RxBool isLoading = true.obs;
  final RxList<BookingItem> bookingData = <BookingItem>[].obs;
// 2. Your updated method
  Future<void> bookingList() async {
    try {
      isLoading.value = true;

      final UserModel? user = StorageService.to.getUser();
      final int userId = user?.id ?? 0;

      if (userId == 0) {
        Get.snackbar(
            'Error',
            'User not found. Please log in again.',
            snackPosition: SnackPosition.BOTTOM
        );
        return;
      }

      final response = await TicketBooking.ticketBookingList(
        paymentStatus: 'success',
        perPage: 10,
      );

      if (response.success) {
        bookingData.value = response.data;
      } else {
        Get.snackbar(
          'Error',
          response.message ,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('Booking Error: $e');
      Get.snackbar(
        'Error',
        'Something went wrong while fetching your bookings.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false; // Stop loading whether it succeeded or failed
    }
  }
  @override
  void onInit() {
    super.onInit();
    // This triggers the API call automatically when the controller is loaded
    bookingList();
  }
}
