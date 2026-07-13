import '../common/constant/app_imports.dart';
import '../core/models/login_model/otp_verification_response_model.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find<StorageService>();

  late SharedPreferences _prefs;

  // Storage Keys
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _languageKey = 'app_language';
  // Initialize the service (Call this in main.dart)
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // ==========================================
  // TOKEN MANAGEMENT
  // ==========================================

  String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  // ==========================================
  // REFRESH TOKEN MANAGEMENT
  // ==========================================

  String? getRefreshToken() {
    return _prefs.getString(_refreshTokenKey);
  }

  Future<void> saveRefreshToken(String token) async {
    await _prefs.setString(_refreshTokenKey, token);
  }

  // ==========================================
  // USER DATA MANAGEMENT
  // ==========================================

  UserModel? getUser() {
    final userStr = _prefs.getString(_userKey);
    if (userStr != null) {
      return UserModel.fromJson(jsonDecode(userStr));
    }
    return null;
  }

  Future<void> saveUser(UserModel user) async {
    // Converts the user object/map into a JSON string before saving
    await _prefs.setString(_userKey, jsonEncode(user));
  }

  // ==========================================
  // CLEAR DATA (LOGOUT)
  // ==========================================
// ==========================================
  // LANGUAGE MANAGEMENT
  // ==========================================

  String? getLanguage() {
    return _prefs.getString(_languageKey);
  }

  Future<void> saveLanguage(String languageCode) async {
    await _prefs.setString(_languageKey, languageCode);
  }

  Future<void> clearAuthData() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_refreshTokenKey);
    await _prefs.remove(_userKey);
  }
}