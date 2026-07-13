import '../../../models/scanner_model/visit_response_model.dart';
import '../../../network/network_api_service.dart';

class VisitApiService {
  static Future<VisitResponseModel> getScanner({required String getUrl}) async {
    try {
      final url = Uri.parse(getUrl
      );
      final response = await ApiClient.get(url);

      return VisitResponseModel.fromJson(response);
    } catch (e) {
      throw Exception('Scan API Failed: $e');
    }
  }
}