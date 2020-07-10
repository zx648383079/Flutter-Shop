import '../models/article_category.dart';

import '../models/article.dart';
import '../utils/http.dart';

class ArticleApi {
  static void getList(SearchForm form, Function(ArticlePage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<ArticlePage>('shop/article',
        data: form.toJson(), success: success, error: error);
  }

  static void get(int id, Function(Article res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Article>('shop/article',
        data: {'id': id}, success: success, error: error);
  }

  static void getCategories(
      int parentId, Function(ArticleCategoryData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<ArticleCategoryData>('shop/article/category',
        data: {'parent_id': parentId}, success: success, error: error);
  }

  static void getSuggestion(String keywords, Function(ArticleData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<ArticleData>('shop/article/suggest',
        data: {'keywords': keywords}, success: success, error: error);
  }
}
