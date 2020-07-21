import '../models/bulletin.dart';
import '../models/page.dart';
import '../models/search.dart';
import '../utils/http.dart';

class BulletinApi {
  static void getList(PageForm page, Function(BulletinUserPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('auth/bulletin', data: page.toJson(),
        success: (res) {
      success(BulletinUserPage.fromJson(res));
    }, error: error);
  }

  static void get(int id, Function(BulletinUser res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('auth/bulletin/info', data: {"id": id},
        success: (res) {
      success(BulletinUser.fromJson(res));
    }, error: error);
  }

  static void read(int id, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.put<Map<String, dynamic>>('auth/bulletin/read', data: {"id": id},
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void readAll(Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.put<Map<String, dynamic>>('auth/bulletin/read_all',
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void remove(int id, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Map<String, dynamic>>('auth/bulletin/delete',
        data: {"id": id}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }
}
