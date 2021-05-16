import '../models/page.dart';
import '../models/product.dart';
import '../models/search.dart';
import '../utils/http.dart';

class ProductApi {
  static void getList(SearchForm form, Function(ProductPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/goods', data: form.toJson(),
        success: (res) {
      success(ProductPage.fromJson(res));
    }, error: error);
  }

  static void getListById(
      Map<String, dynamic> data, Function(ProductPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/goods', data: data,
        success: (res) {
      success(ProductPage.fromJson(res));
    }, error: error);
  }

  static void get(int id, Function(Product res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/goods', data: {'id': id},
        success: (res) {
      success(Product.fromJson(res));
    }, error: error);
  }

  static void getRecommend(int id, Function(ProductData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/goods/recommend',
        data: {'id': id}, success: (res) {
      success(ProductData.fromJson(res));
    }, error: error);
  }

  static void getHome(Function(HomeProduct res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/goods/home', success: (res) {
      success(HomeProduct.fromJson(res));
    }, error: error);
  }

  static void getHotKeywords(Function(StringData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/search/keywords',
        success: (res) {
      success(StringData.fromJson(res));
    }, error: error);
  }

  static void getTips(String keywords, Function(StringData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/search/tips',
        data: {'keywords': keywords}, success: (res) {
      success(StringData.fromJson(res));
    }, error: error);
  }
}
