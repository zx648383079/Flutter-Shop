import 'dart:ffi';

import '../models/site.dart';
import '../utils/http.dart';

class SiteApi {
  static void get(Function(Site site) success, [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/home/index', success: (res) {
      success(Site.fromJson(res));
    }, error: error);
  }

  static void emoji(Function(String data) success,
      [ErrorCallback? error]) async {
    RestClient.get<String>('seo/emoji', success: success, error: error);
  }
}
