class OtpVerificationResponseModel {
  final bool success;
  final String message;
  final String? token;
  final UserModel user;

  OtpVerificationResponseModel({
    required this.success,
    required this.message,
    this.token,
    required this.user,
  });

  factory OtpVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationResponseModel(
      success: json['success'] ,
      message: json['message'] ,
      token: json['token'] as String?,
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : UserModel.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'user': user?.toJson(),
    };
  }
}

class UserModel {
  final int id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? updatedAt;
  final String? createdAt;

  UserModel({
    required this.id,
    this.name,
    this.mobile,
    this.email,
    this.updatedAt,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ??0,
      name: json['name'] ??"",
      mobile: json['mobile'] ??"",
      email: json['email']??"",
      updatedAt: json['updated_at'] ??"",
      createdAt: json['created_at'] ??"",
    );
  }
  factory UserModel.empty() {
    return UserModel(
      id: 0,
      email: '',
      name: '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'email': email,
      'updated_at': updatedAt,
      'created_at': createdAt,
    };
  }
}