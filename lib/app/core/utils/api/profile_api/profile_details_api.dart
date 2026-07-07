import '../../../../common/constant/app_imports.dart';
import '../../../../services/storage_services.dart';
import '../../../constant_api/api_constant.dart';
import '../../../models/login_model/otp_verification_response_model.dart';
import '../../../models/profile/get_profile_response.dart';
import '../../../models/profile/profile_response.dart';
import '../../../models/profile/profile_update_payload.dart';
import '../../../network/network_api_service.dart';
class ProfileDetailsApi {
  static Future<ProfileResponse> getProfile() async {
    try {
      final UserModel? user = StorageService.to.getUser();
      final int userId = user?.id ?? 0;

      if (userId == 0) {
        throw Exception('User ID not found. User might be logged out.');
      }

      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.getProfile}$userId',
      );

      debugPrint('Fetching profile from: $url');

      final response = await ApiClient.get(
        url,
      );

      return ProfileResponse.fromJson(response);

    } catch (e) {
      throw Exception('Profile Fetch Failed: $e');
    }
  }
  static Future<ProfileUpdateResponse> profileUpdate({required UserPayload payload}) async {
    try {
      final UserModel? user = StorageService.to.getUser();
      final int userId = user?.id ?? 0;

      if (userId == 0) {
        throw Exception('User ID not found. User might be logged out.');
      }

      final url = Uri.parse(
        '${ApiConstant.BASE_URL}${ApiConstant.profileUpdate}',
      );

      debugPrint('Fetching profile from: $url');

      final response = await ApiClient.post(
        url,
          body: payload
      );

      return ProfileUpdateResponse.fromJson(response);

    } catch (e) {
      throw Exception('Profile Fetch Failed: $e');
    }
  }
}