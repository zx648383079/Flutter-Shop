import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
import 'page.dart';
import 'product.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Object {
  int id;
  @JsonKey(name: 'series_number')
  String? seriesNumber;
  @JsonKey(name: 'status_label')
  String? statusLabel;
  int? status;
  @JsonKey(name: 'goods_amount')
  double? goodsAmount;
  @JsonKey(name: 'payment_id')
  int? paymentId;
  @JsonKey(name: 'payment_name')
  String? paymentName;
  @JsonKey(name: 'shipping_id')
  int? shippingId;
  @JsonKey(name: 'shipping_name')
  String? shippingName;
  @JsonKey(name: 'shipping_fee')
  double? shippingFee;
  @JsonKey(name: 'pay_fee')
  double? payFee;
  double? discount;
  @JsonKey(name: 'order_amount')
  double? orderAmount;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'pay_at')
  String? payAt;
  @JsonKey(name: 'shipping_at')
  String? shippingAt;
  @JsonKey(name: 'receive_at')
  String? receiveAt;
  @JsonKey(name: 'finish_at')
  String? finishAt;
  List<OrderGoods>? goods;
  Address? address;

  Order(this.id, this.seriesNumber);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderPage extends Object {
  Paging paging;
  List<Order> data;

  OrderPage(this.data, this.paging);

  factory OrderPage.fromJson(Map<String, dynamic> json) =>
      _$OrderPageFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPageToJson(this);
}

@JsonSerializable()
class OrderGoods extends Object {
  int id;
  String name;
  int? status;
  int? amount;
  String? thumb;
  double? price;
  @JsonKey(name: 'goods_id')
  int? goodsId;
  Product? goods;

  OrderGoods(this.id, this.name);

  factory OrderGoods.fromJson(Map<String, dynamic> json) =>
      _$OrderGoodsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderGoodsToJson(this);
}

@JsonSerializable()
class OrderGoodsData extends Object {
  List<OrderGoods> data;

  OrderGoodsData(this.data);

  factory OrderGoodsData.fromJson(Map<String, dynamic> json) =>
      _$OrderGoodsDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderGoodsDataToJson(this);
}

@JsonSerializable()
class OrderGoodsPage extends Object {
  Paging paging;
  List<OrderGoods> data;

  OrderGoodsPage(this.data, this.paging);

  factory OrderGoodsPage.fromJson(Map<String, dynamic> json) =>
      _$OrderGoodsPageFromJson(json);

  Map<String, dynamic> toJson() => _$OrderGoodsPageToJson(this);
}

@JsonSerializable()
class OrderCount extends Object {
  @JsonKey(name: 'un_pay')
  int unPay = 0;
  int shipped = 0;
  int finish = 0;
  int cancel = 0;
  int invalid = 0;
  @JsonKey(name: 'paid_un_ship')
  int paidUnShip = 0;
  int received = 0;
  int uncomment = 0;
  int refunding = 0;

  OrderCount(this.unPay, this.shipped);

  factory OrderCount.fromJson(Map<String, dynamic> json) =>
      _$OrderCountFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCountToJson(this);
}

@JsonSerializable()
class Logistics extends Object {
  int id;
  String content;
  @JsonKey(name: 'created_at')
  String createdAt;

  Logistics(this.id, this.content, this.createdAt);

  factory Logistics.fromJson(Map<String, dynamic> json) =>
      _$LogisticsFromJson(json);

  Map<String, dynamic> toJson() => _$LogisticsToJson(this);
}

@JsonSerializable()
class LogisticsData extends Object {
  List<Logistics> data;

  LogisticsData(this.data);

  factory LogisticsData.fromJson(Map<String, dynamic> json) =>
      _$LogisticsDataFromJson(json);

  Map<String, dynamic> toJson() => _$LogisticsDataToJson(this);
}

@JsonSerializable()
class PrePay extends Object {
  bool success;
  String? url;
  String? html;
  Object params;

  PrePay(this.success, this.params);

  factory PrePay.fromJson(Map<String, dynamic> json) => _$PrePayFromJson(json);

  Map<String, dynamic> toJson() => _$PrePayToJson(this);
}

@JsonSerializable()
class PrePayData extends Object {
  PrePay data;

  PrePayData(this.data);

  factory PrePayData.fromJson(Map<String, dynamic> json) =>
      _$PrePayDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrePayDataToJson(this);
}

// ignore: camel_case_types
class ORDER_STATUS {
  // ignore: non_constant_identifier_names
  static final int CANCEL = 1;
  // ignore: non_constant_identifier_names
  static final int INVALID = 2;
  // ignore: non_constant_identifier_names
  static final int UN_PAY = 10;
  // ignore: non_constant_identifier_names
  static final int PAID_UN_SHIP = 20;
  // ignore: non_constant_identifier_names
  static final int SHIPPED = 40;
  // ignore: non_constant_identifier_names
  static final int RECEIVED = 60;
  // ignore: non_constant_identifier_names
  static final int FINISH = 80;
}
