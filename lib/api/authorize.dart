import '../utils/http.dart';
import '../models/authorize.dart';

class AuthorizeApi {
  static void checkQrToken(String token, Function(QrToken res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/qr', data: {'token': token},
        success: (res) {
      success(QrToken.fromJson(res));
    }, error: error);
  }

  static void authorizeQrToken(QrAction form, Function(QrToken res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/qr/authorize',
        data: form.toJson(), success: (res) {
      success(QrToken.fromJson(res));
    }, error: error);
  }
}
