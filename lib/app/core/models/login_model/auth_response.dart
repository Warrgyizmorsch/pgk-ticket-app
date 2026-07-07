import 'otp_verification_response_model.dart';

class AuthResponseModel {
  final bool success;
  final String token;
  final UserModel user;

  AuthResponseModel({
    required this.success,
    required this.token,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json['success'] ,
      token: json['token'] ,
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : UserModel.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'token': token,
      'user': user.toJson(),
    };
  }
}

class AuthUserModel {
  final int? id;
  final String? email;
  final String? name;
  final String? firebaseUid;
  final String? createdAt;
  final String? updatedAt;

  AuthUserModel({
    this.id,
    this.email,
    this.name,
    this.firebaseUid,
    this.createdAt,
    this.updatedAt,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      firebaseUid: json['firebase_uid'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'firebase_uid': firebaseUid,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}