import '../login_model/otp_verification_response_model.dart';

class ProfileUpdateResponse {
  final bool success;
  final String status;
  final String message;
  final UserModel data;

  ProfileUpdateResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileUpdateResponse.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateResponse(
      success: json['success'] ?? false,
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: UserModel.fromJson(json['data']),
    );
  }
}