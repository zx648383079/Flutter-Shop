import 'dart:async';

import 'package:flutter_shop/api/address.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/api/site.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/address.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/site.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/utils/types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static Site site;
  static User user;
  static String token;
  static bool isBooted = false;
  static List<CartGroup> cart;
  static List<Address> addressItems;
  static Address address;
  static Order order;

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

  static void setCart(List<CartGroup> data) {
    cart = data;
  }

  static void getAddressList(Function(List<Address> res) success) {
    if (addressItems != null) {
      success(addressItems);
      return;
    }
    AddressApi.getList((res) {
      addressItems = res.data;
      success(addressItems);
    }, (code, message) {
      if (code == 401) {
        removeToken();
      }
      addressItems = null;
      success(<Address>[]);
    });
  }

  static void getAddress(Function(Address res) success) {
    if (address != null) {
      success(address);
      return;
    }
    getAddressList((res) {
      for (var item in res) {
        if (item.isDefault) {
          address = item;
          success(address);
          return;
        }
      }
      success(null);
    });
  }

  static void getOrder(int id, Function(Order res) success) {
    if (order != null && order.id == id) {
      success(order);
      return;
    }
    OrderApi.get(id, (res) {
      order = res;
      success(order);
    }, (code, message) {
      success(null);
    });
  }
}
