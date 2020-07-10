import '../utils/http.dart';
import '../models/authorize.dart';

class AuthorizeApi {
  static void checkQrToken(String token, Function(QrToken res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<QrToken>('auth/qr',
        data: {'token': token}, success: success, error: error);
  }

  static void authorizeQrToken(QrAction form, Function(QrToken res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<QrToken>('auth/qr/authorize',
        data: form.toJson(), success: success, error: error);
  }
}
