import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
import 'product.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Object {
  int id;
  @JsonKey(name: 'series_number')
  String seriesNumber;
  @JsonKey(name: 'status_label')
  String statusLabel;
  int status;
  @JsonKey(name: 'goods_amount')
  int goodsAmount;
  @JsonKey(name: 'payment_id')
  int paymentId;
  @JsonKey(name: 'payment_name')
  String paymentName;
  @JsonKey(name: 'shipping_id')
  int shippingId;
  @JsonKey(name: 'shipping_name')
  String shippingName;
  List<OrderGoods> goods;
  Address address;

  Order(this.id, this.seriesNumber);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderGoods extends Object {
  int id;
  String name;
  int status;
  int amount;
  double price;
  @JsonKey(name: 'goods_id')
  int goodsId;
  Product goods;

  OrderGoods(this.id, this.name);

  factory OrderGoods.fromJson(Map<String, dynamic> json) =>
      _$OrderGoodsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderGoodsToJson(this);
}

@JsonSerializable()
class OrderCount extends Object {
  @JsonKey(name: 'un_pay')
  int unPay;
  int shipped;
  int finish;
  int cancel;
  int invalid;
  @JsonKey(name: 'paid_un_ship')
  int paidUnShip;
  int received;
  int uncomment;
  int refunding;

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
class CheckIn extends Object {
  int id;
  int running;
  @JsonKey(name: 'created_at')
  String createdAt;
  int type;

  CheckIn(this.id, this.running, this.createdAt, this.type);

  factory CheckIn.fromJson(Map<String, dynamic> json) =>
      _$CheckInFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInToJson(this);
}

@JsonSerializable()
class PrePay extends Object {
  bool success;
  String url;
  String html;
  Object params;

  PrePay(this.success, this.params);

  factory PrePay.fromJson(Map<String, dynamic> json) => _$PrePayFromJson(json);

  Map<String, dynamic> toJson() => _$PrePayToJson(this);
}

mixin ORDER_STATUS {
  // ignore: non_constant_identifier_names
  int CANCEL = 1;
  // ignore: non_constant_identifier_names
  int INVALID = 2;
  // ignore: non_constant_identifier_names
  int UN_PAY = 10;
  // ignore: non_constant_identifier_names
  int PAID_UN_SHIP = 20;
  // ignore: non_constant_identifier_names
  int SHIPPED = 40;
  // ignore: non_constant_identifier_names
  int RECEIVED = 60;
  // ignore: non_constant_identifier_names
  int FINISH = 80;
}