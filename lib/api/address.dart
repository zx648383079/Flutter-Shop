import '../models/page.dart';
import '../utils/http.dart';
import '../models/address.dart';

class AddressApi {
  static void getList(Function(AddressData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/address', success: (res) {
      success(AddressData.fromJson(res));
    }, error: error);
  }

  static void get(int id, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/address', data: {'id': id},
        success: (res) {
      success(Address.fromJson(res));
    }, error: error);
  }

  static void create(Map<String, String> data, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/address/create', data: data,
        success: (res) {
      success(Address.fromJson(res));
    }, error: error);
  }

  static void update(Map<String, String> data, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.put<Map<String, dynamic>>('shop/address/update', data: data,
        success: (res) {
      success(Address.fromJson(res));
    }, error: error);
  }

  static void setDefault(int id, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/address/default',
        data: {'id': id}, success: (res) {
      success(Address.fromJson(res));
    }, error: error);
  }

  static void remove(int id, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Map<String, dynamic>>('shop/address/delete',
        data: {'id': id}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }
}
