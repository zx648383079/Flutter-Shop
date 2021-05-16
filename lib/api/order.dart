import 'package:flutter_shop/models/page.dart';
import 'package:flutter_shop/models/payment.dart';

import '../models/order.dart';
import '../models/search.dart';
import '../utils/http.dart';

class OrderApi {
  static void getList(OrderForm page, Function(OrderPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/order', data: page.toJson(),
        success: (res) {
      success(OrderPage.fromJson(res));
    }, error: error);
  }

  static void get(int id, Function(Order res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/order', data: {'id': id},
        success: (res) {
      success(Order.fromJson(res));
    }, error: error);
  }

  static void pay(int order, int payment, Function(PrePayData res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('shop/pay',
        data: {'order': order, 'payment': payment}, success: (res) {
      success(PrePayData.fromJson(res));
    }, error: error);
  }

  static void getSubtotal(Function(OrderCount res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/order/count', success: (res) {
      success(OrderCount.fromJson(res));
    }, error: error);
  }

  static void receive(int id, Function(Order res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('shop/order/receive',
        data: {'id': id}, success: (res) {
      success(Order.fromJson(res));
    }, error: error);
  }

  static void cancel(int id, Function(Order res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('shop/order/cancel', data: {'id': id},
        success: (res) {
      success(Order.fromJson(res));
    }, error: error);
  }

  static void logistics(int id, Function(LogisticsData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/order/logistics',
        data: {'id': id}, success: (res) {
      success(LogisticsData.fromJson(res));
    }, error: error);
  }

  static void commentGoods(
      Map<String, dynamic> data, Function(ResponseBool res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('shop/order/comment_save', data: data,
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void getRefundGoodsList(
      Map<String, dynamic> data, Function(OrderGoodsPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/refund', data: data,
        success: (res) {
      success(OrderGoodsPage.fromJson(res));
    }, error: error);
  }

  static void getRefundGoods(
      Map<String, dynamic> data, Function(OrderGoodsData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/refund/goods', data: data,
        success: (res) {
      success(OrderGoodsData.fromJson(res));
    }, error: error);
  }

  static void getCommentGoods(
      Map<String, dynamic> data, Function(OrderGoodsPage res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/order/comment', data: data,
        success: (res) {
      success(OrderGoodsPage.fromJson(res));
    }, error: error);
  }

  static void getUnCommentGoods(
      Map<String, dynamic> data, Function(OrderGoodsData res) success,
      [ErrorCallback? error]) async {
    RestClient.get<Map<String, dynamic>>('shop/order/comment_goods', data: data,
        success: (res) {
      success(OrderGoodsData.fromJson(res));
    }, error: error);
  }

  static void getPaymentList(int order, Function(PaymentData res) success,
      [ErrorCallback? error]) async {
    RestClient.post<Map<String, dynamic>>('shop/cashier/payment',
        data: {'order': order}, success: (res) {
      success(PaymentData.fromJson(res));
    }, error: error);
  }
}
