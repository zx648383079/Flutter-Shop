import '../models/user.dart';
import '../utils/http.dart';

class UserApi {
  static void get(Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.get<User>('auth/user', success: success, error: error);
  }
}
