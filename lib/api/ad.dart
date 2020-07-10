import '../models/ad.dart';
import '../utils/http.dart';

class AdApi {
  static void get(dynamic position, Function(AdData site) success,
      [Function(int code, String message) error]) async {
    RestClient.get<AdData>('shop/ad',
        data: {'position': position}, success: success, error: error);
  }

  static void banners(Function(AdData site) success,
      [Function(int code, String message) error]) async {
    RestClient.get<AdData>('shop/ad/banner', success: success, error: error);
  }
}
