import '../../../constant_api/api_constant.dart';

import '../../../models/login_model/auth_response.dart';
import '../../../models/login_model/otp_generate_response.dart';
import '../../../models/login_model/otp_verification_response_model.dart';
import '../../../network/network_api_service.dart';

class AppLogin {
  static Future<OtpResponseModel> requestPhoneOtp({
    required Map<String, dynamic> data,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.generateOtp}',
      );

      final response = await ApiClient.post(
        url,
        body: data,
      );

      return OtpResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }
  static Future<OtpVerificationResponseModel> verifyOtp({
    required Map<String, dynamic> data,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.verifyOtp}',
      );

      final response = await ApiClient.post(
        url,
        body: data,
      );

      return OtpVerificationResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }
  static Future<AuthResponseModel> googleLogin({
    required Map<String, dynamic> data,
  }) async {
    try {
      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.googleLogin}',
      );

      final response = await ApiClient.post(
        url,
        body: data,
      );

      return AuthResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Login Failed: $e');
    }
  }
}