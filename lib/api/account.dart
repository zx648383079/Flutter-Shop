import '../models/connect.dart';
import '../models/driver.dart';
import '../models/page.dart';
import '../models/user.dart';

import '../models/account.dart';
import '../models/search.dart';

import '../utils/http.dart';

class AccountApi {
  static void getLogs(PageForm page, Function(AccountLogPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/account/log',
        data: page.toJson(), success: (res) {
      success(AccountLogPage.fromJson(res));
    }, error: error);
  }

  static void getBankCard(PageForm page, Function(CardPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<CardPage>('shop/account/card',
        data: page.toJson(), success: success, error: error);
  }

  static void getSubtotal(Function(AccountSubtotal res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<AccountSubtotal>('shop/account/subtotal',
        success: success, error: error);
  }

  static void getConnect(Function(ConnectData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<ConnectData>('auth/account/connect',
        success: success, error: error);
  }

  static void getDriver(Function(DriverData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<DriverData>('auth/account/driver',
        success: success, error: error);
  }

  static void saveFeedback(
      Map<String, String> data, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('contact/home/feedback',
        data: data, success: success, error: error);
  }

  static void cancelUser(Map<String, String> data, Function(User res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<User>('auth/account/cancel',
        data: data, success: success, error: error);
  }
}
