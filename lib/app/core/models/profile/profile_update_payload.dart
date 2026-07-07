class UserPayload {
  final int userId;
  final String name;
  final String email;
  final String mobile;

  UserPayload({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
  });

  /// Factory constructor to create a new instance from a JSON map
  factory UserPayload.fromJson(Map<String, dynamic> json) {
    return UserPayload(
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }

  /// Converts the instance to a JSON map for API payloads
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'mobile': mobile,
    };
  }
}