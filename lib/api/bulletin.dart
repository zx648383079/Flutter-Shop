import 'package:flutter_shop/models/user_item.dart';

import '../models/bulletin.dart';
import '../models/page.dart';
import '../models/search.dart';
import '../utils/http.dart';

class BulletinApi {
  static void getList(
      Map<dynamic, dynamic> data, Function(BulletinUserPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('auth/bulletin', data: data,
        success: (res) {
      success(BulletinUserPage.fromJson(res));
    }, error: error);
  }

  static void users(Function(List<UserItem> res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('auth/bulletin/user', success: (res) {
      if (res['data'] == null) {
        return success(<UserItem>[]);
      }
      success((res['data'] as List<dynamic>)
          .map((e) => UserItem.fromJson(e))
          .toList());
    }, error: error);
  }

  static void get(int id, Function(BulletinUser res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('auth/bulletin/info', data: {"id": id},
        success: (res) {
      success(BulletinUser.fromJson(res));
    }, error: error);
  }

  static void read(int id, Function(ResponseBool res) success,
      [ErrorCallback? error]) async {
    RestClient.put<Map<String, dynamic>>('auth/bulletin/read', data: {"id": id},
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void readAll(Function(ResponseBool res) success,
      [ErrorCallback? error]) async {
    RestClient.put<Map<String, dynamic>>('auth/bulletin/read_all',
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void remove(int id, Function(ResponseBool res) success,
      [ErrorCallback? error]) async {
    RestClient.delete<Map<String, dynamic>>('auth/bulletin/delete',
        data: {"id": id}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }
}
