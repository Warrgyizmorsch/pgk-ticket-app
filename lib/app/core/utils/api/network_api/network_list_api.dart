import 'package:flutter/foundation.dart';
import '../../../constant_api/api_constant.dart';
import '../../../models/network_model/network_list_response.dart';
import '../../../network/network_api_service.dart';

class NetworkApiService {
  static Future<NetworkListResponseModel> getNetworkList() async {
    try {
      final url = Uri.parse('${ApiConstant.BASE_URL}${ApiConstant.networkList}');
      debugPrint('Fetching network list from: $url');
      final response = await ApiClient.get(url);
      return NetworkListResponseModel.fromJson(response);
    } catch (e) {
      debugPrint('Error fetching network list: $e');
      throw Exception('Network List API Failed: $e');
    }
  }
}
