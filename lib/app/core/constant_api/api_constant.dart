

class ApiConstant {
  static const BASE_URL = "https://pgk.londonstreetstore.com/api/";
  static const Webview_URL = "https://www.assignnmentinneed.com/PrivacyPolicy";
  static const String? FALLBACK_BEARER_TOKEN =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiU3VwZXIgQWRtaW4iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIlJvbGVJZCI6IjEiLCJDb21wYW55SWQiOiIxIiwiZXhwIjoxNzYzNDY5ODA5LCJpc3MiOiJZYWNodEJvb2tpbmciLCJhdWQiOiJZYWNodEJvb2tpbmctVXNlcnMifQ.-KP5dh4wHR_MdL_gYRjOi3rqqhGKX6wVjTn_Vq08990";



  // ---------- BOOKING ----------


  static String get baseOrigin {
    final baseUri = Uri.parse(BASE_URL);
    return Uri(
      scheme: baseUri.scheme,
      host: baseUri.host,
      port: baseUri.hasPort ? baseUri.port : null,
    ).toString();
  }

  static String resolveAssetUrl(String path) {
    if (path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    final normalizedPath = path.startsWith('/') ? path.substring(1) : path;
    final origin = baseOrigin.endsWith('/') ? baseOrigin : '$baseOrigin/';
    return Uri.parse(origin).resolve(normalizedPath).toString();
  }

  // Auth Endpoints
  static const String generateOtp = "generate-otp";
  static const String verifyOtp = "verify-otp";
  static const String googleLogin = "google-login";
  static const String ticketBooking = "ticket/store";
  static const String COUNTRIES = "countries";
  static const String WORD_COUNT = "word-count";
  static const String URGENCIES = "urgencies";
  static const String SUBJECTS = "subjects";
  static const String WORK_TYPES = "work-types";
  static const String ADD_ORDER = "add-order";
  static const String CART_LIST = "cart-list";
  static const String DELETE_CART_ITEM = "delete-cart-item";
  static const String UPDATE_CART_ITEM = "update-cart-item";




// More endpoints will be added as we build the app
}

