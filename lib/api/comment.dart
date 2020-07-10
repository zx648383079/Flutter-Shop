import '../models/comment.dart';
import '../models/search.dart';
import '../utils/http.dart';

class CommentApi {
  static void getList(PageForm page, Function(CommentPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<CommentPage>('shop/comment',
        data: page.toJson(), success: success, error: error);
  }

  static void getSubtotal(int id, Function(CommentSubtotal res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<CommentSubtotal>('shop/comment/count',
        data: {'item_id': id, 'item_type': 0}, success: success, error: error);
  }
}
