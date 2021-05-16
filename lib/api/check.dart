import '../models/check.dart';
import '../utils/http.dart';

class CheckApi {
  static void getCanCheckIn(Function(CheckInOne res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('check_in', success: (res) {
      success(CheckInOne.fromJson(res));
    }, error: error);
  }

  static void checkIn(Function(CheckInOne res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('check_in/home/check_in',
        success: (res) {
      success(CheckInOne.fromJson(res));
    }, error: error);
  }

  static void getMonth(String month, Function(CheckInData res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('check_in/home/month',
        data: {'month': month}, success: (res) {
      success(CheckInData.fromJson(res));
    }, error: error);
  }
}
