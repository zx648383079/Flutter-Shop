// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    json['id'] as int,
    json['series_number'] as String,
  )
    ..statusLabel = json['status_label'] as String
    ..status = json['status'] as int
    ..goodsAmount = json['goods_amount'] as int
    ..paymentId = json['payment_id'] as int
    ..paymentName = json['payment_name'] as String
    ..shippingId = json['shipping_id'] as int
    ..shippingName = json['shipping_name'] as String
    ..goods = (json['goods'] as List)
        ?.map((e) =>
            e == null ? null : OrderGoods.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'series_number': instance.seriesNumber,
      'status_label': instance.statusLabel,
      'status': instance.status,
      'goods_amount': instance.goodsAmount,
      'payment_id': instance.paymentId,
      'payment_name': instance.paymentName,
      'shipping_id': instance.shippingId,
      'shipping_name': instance.shippingName,
      'goods': instance.goods,
      'address': instance.address,
    };

OrderGoods _$OrderGoodsFromJson(Map<String, dynamic> json) {
  return OrderGoods(
    json['id'] as int,
    json['name'] as String,
  )
    ..status = json['status'] as int
    ..amount = json['amount'] as int
    ..price = (json['price'] as num)?.toDouble()
    ..goodsId = json['goods_id'] as int
    ..goods = json['goods'] == null
        ? null
        : Product.fromJson(json['goods'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OrderGoodsToJson(OrderGoods instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'amount': instance.amount,
      'price': instance.price,
      'goods_id': instance.goodsId,
      'goods': instance.goods,
    };

OrderCount _$OrderCountFromJson(Map<String, dynamic> json) {
  return OrderCount(
    json['un_pay'] as int,
    json['shipped'] as int,
  )
    ..finish = json['finish'] as int
    ..cancel = json['cancel'] as int
    ..invalid = json['invalid'] as int
    ..paidUnShip = json['paid_un_ship'] as int
    ..received = json['received'] as int
    ..uncomment = json['uncomment'] as int
    ..refunding = json['refunding'] as int;
}

Map<String, dynamic> _$OrderCountToJson(OrderCount instance) =>
    <String, dynamic>{
      'un_pay': instance.unPay,
      'shipped': instance.shipped,
      'finish': instance.finish,
      'cancel': instance.cancel,
      'invalid': instance.invalid,
      'paid_un_ship': instance.paidUnShip,
      'received': instance.received,
      'uncomment': instance.uncomment,
      'refunding': instance.refunding,
    };

Logistics _$LogisticsFromJson(Map<String, dynamic> json) {
  return Logistics(
    json['id'] as int,
    json['content'] as String,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$LogisticsToJson(Logistics instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': instance.createdAt,
    };

CheckIn _$CheckInFromJson(Map<String, dynamic> json) {
  return CheckIn(
    json['id'] as int,
    json['running'] as int,
    json['created_at'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$CheckInToJson(CheckIn instance) => <String, dynamic>{
      'id': instance.id,
      'running': instance.running,
      'created_at': instance.createdAt,
      'type': instance.type,
    };

PrePay _$PrePayFromJson(Map<String, dynamic> json) {
  return PrePay(
    json['success'] as bool,
    json['params'],
  )
    ..url = json['url'] as String
    ..html = json['html'] as String;
}

Map<String, dynamic> _$PrePayToJson(PrePay instance) => <String, dynamic>{
      'success': instance.success,
      'url': instance.url,
      'html': instance.html,
      'params': instance.params,
    };
