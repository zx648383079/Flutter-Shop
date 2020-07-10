import '../models/check.dart';
import '../utils/http.dart';

class CheckApi {
  static void getCanCheckIn(Function(CheckInOne res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<CheckInOne>('check_in', success: success, error: error);
  }

  static void checkIn(Function(CheckInOne res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<CheckInOne>('check_in/home/check_in',
        success: success, error: error);
  }

  static void getMonth(String month, Function(CheckInData res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<CheckInData>('check_in/home/month',
        data: {'month': month}, success: success, error: error);
  }
}
