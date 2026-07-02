import '../../../constant_api/api_constant.dart';
import '../../../models/booking/booking_payload_model.dart';
import '../../../models/booking/booking_response_model.dart';
import '../../../network/network_api_service.dart';

class TicketBooking {
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


}