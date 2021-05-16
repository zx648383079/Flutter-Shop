import '../models/ad.dart';
import '../utils/http.dart';

class AdApi {
  static void get(dynamic position, Function(AdData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/ad',
        data: {'position': position}, success: (res) {
      success(AdData.fromJson(res));
    }, error: error);
  }

  static void banners(Function(AdData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/ad/banner', success: (res) {
      success(AdData.fromJson(res));
    }, error: error);
  }
}
