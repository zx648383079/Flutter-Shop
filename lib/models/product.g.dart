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
    ..image = json['image'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..marketPrice = (json['market_price'] as num)?.toDouble()
    ..stock = json['stock'] as int
    ..isCollect = json['is_collect'] as bool
    ..amount = json['amount'] as int
    ..gallery = (json['gallery'] as List)
        ?.map((e) =>
            e == null ? null : CommentImage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..content = json['content'] as String;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'image': instance.image,
      'price': instance.price,
      'market_price': instance.marketPrice,
      'stock': instance.stock,
      'is_collect': instance.isCollect,
      'amount': instance.amount,
      'gallery': instance.gallery,
      'content': instance.content,
    };

ProductPage _$ProductPageFromJson(Map<String, dynamic> json) {
  return ProductPage(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['paging'] == null
        ? null
        : Paging.fromJson(json['paging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductPageToJson(ProductPage instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'data': instance.data,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  return ProductData(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

HomeProduct _$HomeProductFromJson(Map<String, dynamic> json) {
  return HomeProduct()
    ..hotProducts = (json['hot_products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..newProducts = (json['new_products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..bestProducts = (json['best_products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$HomeProductToJson(HomeProduct instance) =>
    <String, dynamic>{
      'hot_products': instance.hotProducts,
      'new_products': instance.newProducts,
      'best_products': instance.bestProducts,
    };
