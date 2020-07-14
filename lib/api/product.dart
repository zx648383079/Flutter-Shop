import '../models/page.dart';
import '../models/product.dart';
import '../models/search.dart';
import '../utils/http.dart';

class ProductApi {
  static void getList(SearchForm form, Function(ProductPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<ProductPage>('shop/goods',
        data: form.toJson(), success: success, error: error);
  }

  static void get(int id, Function(Product res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Product>('shop/goods',
        data: {'id': id}, success: success, error: error);
  }

  static void getRecommend(int id, Function(ProductData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<ProductData>('shop/goods/recommend',
        data: {'id': id}, success: success, error: error);
  }

  static void getHome(Function(HomeProduct res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/goods/home', success: (res) {
      success(HomeProduct.fromJson(res));
    }, error: error);
  }

  static void getHotKeywords(Function(StringData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<StringData>('shop/search/keywords',
        success: success, error: error);
  }

  static void getTips(String keywords, Function(StringData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<StringData>('shop/search/tips',
        data: {'keywords': keywords}, success: success, error: error);
  }
}
