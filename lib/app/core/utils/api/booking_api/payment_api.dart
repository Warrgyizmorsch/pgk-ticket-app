import '../../../../services/storage_services.dart';
import '../../../constant_api/api_constant.dart';
import '../../../models/booking/booking_payment_payload.dart';
import '../../../models/booking/booking_payment_response.dart';
import '../../../models/login_model/otp_verification_response_model.dart';
import '../../../network/network_api_service.dart';

class BookingPayment{
  static Future<PaymentResponseModel> makePayment({
    required PaymentModel data,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.payment}',
      );

      final response = await ApiClient.post(
        url,
        body: data,
      );

      return PaymentResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Payment Failed: $e');
    }
  }
  static Future<PaymentResponseModel> getPaymentById({
    required int paymentId,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.booking}/$paymentId${ApiConstant.payment}',
      );

      final response = await ApiClient.get(
        url,
      );

      return PaymentResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Payment Failed: $e');
    }
  }
  static Future<PaymentResponseModel> paymentHistory({
    String? status,
    String? perPage,
    int? bookingId,
    String? gateway,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      final UserModel? user = StorageService.to.getUser();
      final int userId = user?.id ?? 0;

      if (userId == 0) {
        throw Exception('User ID not found. User might be logged out.');
      }

      final String fullUrlString = '${ApiConstant.BASE_URL}${ApiConstant.paymentHistory}';

      final Map<String, String> queryParams = {};

      queryParams['user_id'] = userId.toString();

      if (status != null && status.isNotEmpty) {
        queryParams['status'] = status;
      }
      if (perPage != null && perPage.isNotEmpty) {
        queryParams['per_page'] = perPage;
      }
      if (bookingId != null) {
        queryParams['booking_id'] = bookingId.toString();
      }
      if (gateway != null && gateway.isNotEmpty) {
        queryParams['gateway'] = gateway;
      }
      if (fromDate != null && fromDate.isNotEmpty) {
        queryParams['from_date'] = fromDate;
      }
      if (toDate != null && toDate.isNotEmpty) {
        queryParams['to_date'] = toDate;
      }

      final Uri url = Uri.parse(fullUrlString).replace(
        queryParameters: queryParams,
      );

      final response = await ApiClient.get(
        url,
      );

      return PaymentResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Payment Failed: $e');
    }
  }
}