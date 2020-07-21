import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/payment.dart';
import 'package:flutter_shop/models/shipping.dart';

import '../models/cart.dart';
import '../utils/http.dart';

class CartApi {
  static void get(Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('shop/cart', success: (res) {
      success(Cart.fromJson(res));
    }, error: error);
  }

  static void addGoods(int goods, int amount, Function(CartDialog res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cart/add',
        data: {'goods': goods, 'amount': amount}, success: (res) {
      success(CartDialog.fromJson(res));
    }, error: error);
  }

  static void updateGoods(int goods, int amount, Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cart/update_goods',
        data: {'goods': goods, 'amount': amount}, success: (res) {
      success(Cart.fromJson(res));
    }, error: error);
  }

  static void updateItem(int id, int amount, Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.put<Map<String, dynamic>>('shop/cart/update',
        data: {'id': id, 'amount': amount}, success: (res) {
      success(Cart.fromJson(res));
    }, error: error);
  }

  static void deleteItem(int id, Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Map<String, dynamic>>('shop/cart/delete',
        data: {'id': id}, success: (res) {
      success(Cart.fromJson(res));
    }, error: error);
  }

  static void deleteAll(Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Map<String, dynamic>>('shop/cart/clear', success: (res) {
      success(Cart.fromJson(res));
    }, error: error);
  }

  static void getPaymentList(
      List<int> goods, int shipping, Function(PaymentData res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cashier/payment',
        data: {'goods': goods, 'shipping': shipping}, success: (res) {
      success(PaymentData.fromJson(res));
    }, error: error);
  }

  static void getShippingList(List<int> goods, int address, int type,
      Function(ShippingData res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cashier/shipping',
        data: {'goods': goods, 'address': address, 'type': type},
        success: (res) {
      success(ShippingData.fromJson(res));
    }, error: error);
  }

  static void previewOrder(List<int> goods, int address, int shipping,
      int payment, int type, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cashier/preview', data: {
      'goods': goods,
      'address': address,
      'type': type,
      'shipping': shipping,
      'payment': payment
    }, success: (res) {
      success(Order.fromJson(res));
    }, error: error);
  }

  static void checkoutOrder(List<int> goods, int address, int shipping,
      int payment, int type, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cashier/checkout', data: {
      'goods': goods,
      'address': address,
      'type': type,
      'shipping': shipping,
      'payment': payment
    }, success: (res) {
      success(Order.fromJson(res));
    }, error: error);
  }
}
