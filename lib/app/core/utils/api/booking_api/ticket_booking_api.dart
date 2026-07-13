
import '../../../../services/storage_services.dart';
import '../../../constant_api/api_constant.dart';
import '../../../models/booking/booking_list_response.dart';
import '../../../models/booking/booking_payload_model.dart';
import '../../../models/booking/booking_response_model.dart';
import '../../../models/booking/ticket_prices_master_response.dart';
import '../../../models/login_model/otp_verification_response_model.dart';
import '../../../network/network_api_service.dart';

class TicketBooking {
  static Future<TicketPricingResponse> ticketPriceMaster() async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.ticketPriceMaster}',
      );

      final response = await ApiClient.get(
        url,
      );

      return TicketPricingResponse.fromJson(response);
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }

  static Future<TicketBookingResponseModel> ticketBooking({
    required TicketBookingModel data,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.ticketBooking}',
      );

      final response = await ApiClient.post(
        url,
        body: data,
      );

      return TicketBookingResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }

  static Future<BookingListResponse> ticketBookingList({
    String paymentStatus = 'success',
    int perPage = 10,
  }) async {
    try {
      final UserModel? user = StorageService.to.getUser();
      final int userId = user?.id ?? 0;

      if (userId == 0) {
        throw Exception('User ID not found. User might be logged out.');
      }
      final baseUrl = '${ApiConstant.BASE_URL}${ApiConstant.booking}'; // Maps to .../api/bookings

      final url = Uri.parse(baseUrl).replace(
        queryParameters: {
          'user_id': userId.toString(),
          // 'payment_status': paymentStatus,
          'per_page': perPage.toString(),
        },
      );

      final response = await ApiClient.get(
        url,
      );

      return BookingListResponse.fromJson(response);

    } catch (e) {
      throw Exception('Failed to fetch booking list: $e');
    }
  }
}