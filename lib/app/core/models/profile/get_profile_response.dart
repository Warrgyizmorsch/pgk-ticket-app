class ProfileResponse {
  final bool success;
  final String status;
  final String message;
  final  ProfileUserData data;

  ProfileResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      data: ProfileUserData.fromJson(json['data']),
    );
  }
}

class ProfileUserData {
  final int id;
  final String name;
  final String email;
  final String role;
  final String mobile;
  final String? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? firebaseUid;

  ProfileUserData({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.mobile,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.firebaseUid,
  });

  factory   ProfileUserData.fromJson(Map<String, dynamic> json) {
    return ProfileUserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      mobile: json['mobile'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      firebaseUid: json['firebase_uid'],
    );
  }
}