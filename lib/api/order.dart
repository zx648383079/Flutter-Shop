import 'package:flutter_shop/models/page.dart';

import '../models/order.dart';
import '../models/search.dart';
import '../utils/http.dart';

class OrderApi {
  static void getList(PageForm page, Function(OrderPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<OrderPage>('shop/order',
        data: page.toJson(), success: success, error: error);
  }

  static void get(int id, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Order>('shop/order',
        data: {'id': id}, success: success, error: error);
  }

  static void pay(int order, int payment, Function(PrePayData res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<PrePayData>('shop/pay',
        data: {'order': order, 'payment': payment},
        success: success,
        error: error);
  }

  static void getSubtotal(Function(OrderCount res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<OrderCount>('shop/order/count',
        success: success, error: error);
  }

  static void receive(int id, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Order>('shop/order/receive',
        data: {'id': id}, success: success, error: error);
  }

  static void cancel(int id, Function(Order res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Order>('shop/order/cancel',
        data: {'id': id}, success: success, error: error);
  }

  static void logistics(int id, Function(LogisticsData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<LogisticsData>('shop/order/logistics',
        data: {'id': id}, success: success, error: error);
  }

  static void commentGoods(
      Map<String, String> data, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('shop/order/comment_save',
        data: data, success: success, error: error);
  }

  static void getRefundGoodsList(
      Map<String, String> data, Function(OrderGoodsPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<OrderGoodsPage>('shop/refund',
        data: data, success: success, error: error);
  }

  static void getRefundGoods(
      Map<String, String> data, Function(OrderGoodsData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<OrderGoodsData>('shop/refund/goods',
        data: data, success: success, error: error);
  }

  static void getCommentGoods(
      Map<String, String> data, Function(OrderGoodsPage res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<OrderGoodsPage>('shop/order/comment',
        data: data, success: success, error: error);
  }

  static void getUnCommentGoods(
      Map<String, String> data, Function(OrderGoodsData res) success,
      [Function(int code, String message) error]) async {
    RestClient.get<OrderGoodsData>('shop/order/comment_goods',
        data: data, success: success, error: error);
  }
}
