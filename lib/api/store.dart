import '../models/store.dart';
import '../models/page.dart';
import '../utils/http.dart';

class StoreApi {
  static void get(int id, Function(Store store) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Store>('shop/store',
        data: {'id': id}, success: success, error: error);
  }

  static void collect(int id, Function(ResponseBool store) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('shop/store/toggle_collect',
        data: {'id': id}, success: success, error: error);
  }
}
