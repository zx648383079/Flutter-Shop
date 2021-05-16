import '../models/site.dart';
import '../utils/http.dart';

class SiteApi {
  static void get(Function(Site site) success, [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/home/index', success: (res) {
      success(Site.fromJson(res));
    }, error: error);
  }
}
