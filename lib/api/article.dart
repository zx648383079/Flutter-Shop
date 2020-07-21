import '../models/article_category.dart';

import '../models/article.dart';
import '../utils/http.dart';

class ArticleApi {
  static void getList(SearchForm form, Function(ArticlePage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/article', data: form.toJson(),
        success: (res) {
      success(ArticlePage.fromJson(res));
    }, error: error);
  }

  static void get(int id, Function(Article res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/article', data: {'id': id},
        success: (res) {
      success(Article.fromJson(res));
    }, error: error);
  }

  static void getCategories(
      int parentId, Function(ArticleCategoryData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/article/category',
        data: {'parent_id': parentId}, success: (res) {
      success(ArticleCategoryData.fromJson(res));
    }, error: error);
  }

  static void getSuggestion(String keywords, Function(ArticleData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/article/suggest',
        data: {'keywords': keywords}, success: (res) {
      success(ArticleData.fromJson(res));
    }, error: error);
  }
}
