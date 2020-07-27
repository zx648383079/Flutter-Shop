import 'dart:async';

import 'package:flutter_shop/api/site.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/site.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/utils/types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static Site site;
  static User user;
  static String token;
  static bool isBooted = false;

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

  static void setUser(User res) {
    if (res != null && res.token != null && res.id > 0) {
      setToken(res.token);
    }
    user = res;
  }

  static Future<User> getUser() async {
    if (isBooted && user != null) {
      return user;
    }
    var token = await getToken();
    if (token == null || token.length < 1) {
      return null;
    }
    Completer<User> completer = Completer();
    UserApi.get((res) {
      user = res;
      completer.complete(res);
    }, (code, err) {
      removeToken();
      completer.complete(null);
    });
    return completer.future;
  }

  static Future<String> getToken() async {
    if (isBooted) {
      return token;
    }
    var prefs = await SharedPreferences.getInstance();
    isBooted = true;
    return token = prefs.getString(TOKEN_KEY);
  }

  static void setToken(String val) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(TOKEN_KEY, val);
    });
    token = val;
    isBooted = true;
  }

  static void removeToken() {
    token = null;
    user = null;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(TOKEN_KEY);
    });
  }
}
