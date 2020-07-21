import '../models/comment.dart';
import '../models/search.dart';
import '../utils/http.dart';

class CommentApi {
  static void getList(PageForm page, Function(CommentPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/comment', data: page.toJson(),
        success: (res) {
      success(CommentPage.fromJson(res));
    }, error: error);
  }

  static void getSubtotal(int id, Function(CommentSubtotal res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/comment/count',
        data: {'item_id': id, 'item_type': 0}, success: (res) {
      success(CommentSubtotal.fromJson(res));
    }, error: error);
  }
}
