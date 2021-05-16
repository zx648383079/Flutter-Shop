import '../models/connect.dart';
import '../models/driver.dart';
import '../models/page.dart';
import '../models/user.dart';

import '../models/account.dart';
import '../models/search.dart';

import '../utils/http.dart';

class AccountApi {
  static void getLogs(PageForm page, Function(AccountLogPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/account/log',
        data: page.toJson(), success: (res) {
      success(AccountLogPage.fromJson(res));
    }, error: error);
  }

  static void getBankCard(PageForm page, Function(CardPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/account/card',
        data: page.toJson(), success: (res) {
      success(CardPage.fromJson(res));
    }, error: error);
  }

  static void getSubtotal(Function(AccountSubtotal res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/account/subtotal',
        success: (res) {
      success(AccountSubtotal.fromJson(res));
    }, error: error);
  }

  static void getConnect(Function(ConnectData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('auth/account/connect',
        success: (res) {
      success(ConnectData.fromJson(res));
    }, error: error);
  }

  static void getDriver(Function(DriverData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('auth/account/driver', success: (res) {
      success(DriverData.fromJson(res));
    }, error: error);
  }

  static void saveFeedback(
      Map<String, String> data, Function(ResponseBool res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('contact/home/feedback', data: data,
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void cancelUser(Map<String, String> data, Function(User res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('auth/account/cancel', data: data,
        success: (res) {
      success(User.fromJson(res));
    }, error: error);
  }
}
