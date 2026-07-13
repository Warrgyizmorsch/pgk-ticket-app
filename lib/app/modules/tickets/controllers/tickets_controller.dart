import '../../../common/constant/app_imports.dart';
import '../../../core/models/booking/booking_list_response.dart';
import '../../../core/models/login_model/otp_verification_response_model.dart';
import '../../../core/utils/api/booking_api/ticket_booking_api.dart';

class TicketsController extends GetxController {
  final RxBool isLoadingSuccess = true.obs;
  final RxBool isLoadMoreSuccess = false.obs;
  final RxList<BookedTicketDataModel> successData = <BookedTicketDataModel>[].obs;
  int perPageSuccess = 10;
  int totalSuccessItems = 0;

  // --- PENDING TAB STATE ---
  final RxBool isLoadingPending = true.obs;
  final RxBool isLoadMorePending = false.obs;
  final RxList<BookedTicketDataModel> pendingData = <BookedTicketDataModel>[].obs;
  int perPagePending = 10;
  int totalPendingItems = 0;

  @override
  void onInit() {
    super.onInit();
    fetchTickets('success', isRefresh: true);
    fetchTickets('pending', isRefresh: true);
  }

  Future<void> fetchTickets(String status, {bool isRefresh = false}) async {
    bool isSuccessTab = status == 'success';

    if (isRefresh) {
      if (isSuccessTab) {
        perPageSuccess = 10;
        if (successData.isEmpty) isLoadingSuccess.value = true;
      } else {
        perPagePending = 10;
        if (pendingData.isEmpty) isLoadingPending.value = true;
      }
    } else {
      if (isSuccessTab) {
        if (successData.length >= totalSuccessItems || isLoadMoreSuccess.value) return;
        isLoadMoreSuccess.value = true;
        perPageSuccess += 20;
      } else {
        if (pendingData.length >= totalPendingItems || isLoadMorePending.value) return;
        isLoadMorePending.value = true;
        perPagePending += 20;
      }
    }

    try {
      final UserModel? user = StorageService.to.getUser();
      if (user?.id == null || user?.id == 0) {
        Get.snackbar('Error', 'User not found. Please log in again.', snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final response = await TicketBooking.ticketBookingList(
        paymentStatus: status,
        perPage: isSuccessTab ? perPageSuccess : perPagePending,
      );

      if (response.success) {
        if (isSuccessTab) {
          successData.value = response.data;
          totalSuccessItems = response.pagination!.total;
        } else {
          pendingData.value = response.data;
          totalPendingItems = response.pagination!.total;
        }
      } else {
        Get.snackbar('Error', response.message, snackPosition: SnackPosition.BOTTOM);
        _revertPagination(isSuccessTab, isRefresh);
      }
    } catch (e) {
      debugPrint('Booking Error ($status): $e');
      Get.snackbar('Error', 'Something went wrong while fetching your bookings.', snackPosition: SnackPosition.BOTTOM);
      _revertPagination(isSuccessTab, isRefresh);
    } finally {
      // 4. Reset Loaders
      if (isSuccessTab) {
        isLoadingSuccess.value = false;
        isLoadMoreSuccess.value = false;
      } else {
        isLoadingPending.value = false;
        isLoadMorePending.value = false;
      }
    }
  }

  void _revertPagination(bool isSuccessTab, bool isRefresh) {
    if (!isRefresh) {
      if (isSuccessTab) {
        perPageSuccess -= 20;
      } else {
        perPagePending -= 20;
      }
    }
  }
}