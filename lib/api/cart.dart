import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/payment.dart';

import '../models/cart.dart';
import '../utils/http.dart';

class CartApi {
  static void get(Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Cart>('shop/cart', success: success, error: error);
  }

  static void addGoods(int goods, int amount, Function(CartDialog res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<CartDialog>('shop/cart/add',
        data: {'goods': goods, 'amount': amount},
        success: success,
        error: error);
  }

  static void updateGoods(int goods, int amount, Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Cart>('shop/cart/update_goods',
        data: {'goods': goods, 'amount': amount},
        success: success,
        error: error);
  }

  static void updateItem(int id, int amount, Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.put<Cart>('shop/cart/update',
        data: {'id': id, 'amount': amount}, success: success, error: error);
  }

  static void deleteItem(int id, Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Cart>('shop/cart/delete',
        data: {'id': id}, success: success, error: error);
  }

  static void deleteAll(Function(Cart res) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Cart>('shop/cart/clear', success: success, error: error);
  }

  static void getPaymentList(
      List<int> goods, int shipping, Function(PaymentData res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<PaymentData>('shop/cashier/payment',
        data: {'goods': goods, 'shipping': shipping},
        success: success,
        error: error);
  }

  static void getShippingList(
      List<int> goods, int address, int type, Function(PaymentData res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<PaymentData>('shop/cashier/shipping',
        data: {'goods': goods, 'address': address, 'type': type},
        success: success,
        error: error);
  }

  static void previewOrder(List<int> goods, int address, int shipping,
      int payment, int type, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Order>('shop/cashier/preview',
        data: {
          'goods': goods,
          'address': address,
          'type': type,
          'shipping': shipping,
          'payment': payment
        },
        success: success,
        error: error);
  }

  static void checkoutOrder(List<int> goods, int address, int shipping,
      int payment, int type, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Order>('shop/cashier/checkout',
        data: {
          'goods': goods,
          'address': address,
          'type': type,
          'shipping': shipping,
          'payment': payment
        },
        success: success,
        error: error);
  }
}
