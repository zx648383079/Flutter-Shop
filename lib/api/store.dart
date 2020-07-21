import '../models/store.dart';
import '../models/page.dart';
import '../utils/http.dart';

class StoreApi {
  static void get(int id, Function(Store store) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/store', data: {'id': id},
        success: (res) {
      success(Store.fromJson(res));
    }, error: error);
  }

  static void collect(int id, Function(ResponseBool store) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/store/toggle_collect',
        data: {'id': id}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }
}
