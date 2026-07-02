class OtpResponseModel {
  final bool? success;
  final String? message;
  final String? mobile;
  final int? otp;

  OtpResponseModel({
    this.success,
    this.message,
    this.mobile,
    this.otp,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      mobile: json['mobile'] as String?,
      otp: json['otp'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'mobile': mobile,
      'otp': otp,
    };
  }
}