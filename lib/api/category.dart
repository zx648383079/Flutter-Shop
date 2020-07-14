import '../models/category.dart';
import '../utils/http.dart';

class CategoryApi {
  static void getList(int parent, Function(CategoryData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/category',
        data: {"parent": parent}, success: (res) {
      success(CategoryData.fromJson(res));
    }, error: error);
  }

  static void get(int id, String extra, Function(CategoryExtra res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/category',
        data: {"id": id, 'extra': extra}, success: (res) {
      success(CategoryExtra.fromJson(res));
    }, error: error);
  }
}
