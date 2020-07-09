// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['name'] as String,
  )
    ..thumb = json['thumb'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..marketPrice = (json['market_price'] as num)?.toDouble()
    ..stock = json['stock'] as int
    ..isCollect = json['is_collect'] as bool
    ..amount = json['amount'] as int;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'price': instance.price,
      'market_price': instance.marketPrice,
      'stock': instance.stock,
      'is_collect': instance.isCollect,
      'amount': instance.amount,
    };
