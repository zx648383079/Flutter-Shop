import '../models/page.dart';
import '../utils/http.dart';
import '../models/address.dart';

class AddressApi {
  static void getList(Function(AddressData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<AddressData>('shop/address', success: success, error: error);
  }

  static void get(int id, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Address>('shop/address',
        data: {'id': id}, success: success, error: error);
  }

  static void create(Map<String, String> data, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Address>('shop/address/create',
        data: data, success: success, error: error);
  }

  static void update(Map<String, String> data, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.put<Address>('shop/address/update',
        data: data, success: success, error: error);
  }

  static void setDefault(int id, Function(Address res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Address>('shop/address/default',
        data: {'id': id}, success: success, error: error);
  }

  static void remove(int id, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<ResponseBool>('shop/address/delete',
        data: {'id': id}, success: success, error: error);
  }
}
