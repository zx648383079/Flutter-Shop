import '../models/site.dart';
import '../utils/http.dart';

class SiteApi {
  static void get(Function(Site site) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Site>('shop/home/index', success: success, error: error);
  }
}
