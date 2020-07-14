import 'package:flutter_shop/api/site.dart';
import 'package:flutter_shop/models/site.dart';
import 'package:flutter_shop/models/user.dart';

class Application {
  static Site site;
  static User user;
  static String token;

  static void getSite(Function(Site site) success) {
    if (site != null) {
      success(site);
      return;
    }
    SiteApi.get((res) {
      site = res;
      success(res);
    });
  }
}
