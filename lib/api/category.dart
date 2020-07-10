import '../models/category.dart';
import '../utils/http.dart';

class CategoryApi {
  static void getList(int parent, Function(CategoryData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<CategoryData>('shop/category',
        data: {"parent": parent}, success: success, error: error);
  }

  static void get(int id, String extra, Function(Category res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Category>('shop/category',
        data: {"id": id, 'extra': extra}, success: success, error: error);
  }
}
