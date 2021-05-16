// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    json['id'] as int,
    json['amount'] as int,
    (json['price'] as num).toDouble(),
    json['is_checked'] as bool,
    json['goods_id'] as int,
    json['product_id'] as int,
    Product.fromJson(json['goods'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'price': instance.price,
      'is_checked': instance.isChecked,
      'goods_id': instance.goodsId,
      'product_id': instance.productId,
      'goods': instance.goods,
    };

CartGroup _$CartGroupFromJson(Map<String, dynamic> json) {
  return CartGroup(
    Store.fromJson(json['shop'] as Map<String, dynamic>),
    json['name'] as String,
    json['checked'] as bool,
    (json['goods_list'] as List<dynamic>)
        .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CartGroupToJson(CartGroup instance) => <String, dynamic>{
      'shop': instance.shop,
      'name': instance.name,
      'checked': instance.checked,
      'goods_list': instance.goodsList,
    };

CartButton _$CartButtonFromJson(Map<String, dynamic> json) {
  return CartButton(
    json['action'] as String,
    json['text'] as String,
  )..reason = json['reason'];
}

Map<String, dynamic> _$CartButtonToJson(CartButton instance) =>
    <String, dynamic>{
      'action': instance.action,
      'text': instance.text,
      'reason': instance.reason,
    };

CartLink _$CartLinkFromJson(Map<String, dynamic> json) {
  return CartLink(
    json['url'] as String,
    json['text'] as String,
  );
}

Map<String, dynamic> _$CartLinkToJson(CartLink instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };

CartCell _$CartCellFromJson(Map<String, dynamic> json) {
  return CartCell(
    json['popup_tip'] as String,
    CartLink.fromJson(json['link'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartCellToJson(CartCell instance) => <String, dynamic>{
      'popup_tip': instance.popupTip,
      'link': instance.link,
    };

CartSubtotal _$CartSubtotalFromJson(Map<String, dynamic> json) {
  return CartSubtotal(
    (json['total'] as num).toDouble(),
    (json['total_weight'] as num).toDouble(),
    (json['original_total'] as num).toDouble(),
    (json['discount_amount'] as num).toDouble(),
    json['count'] as int,
  );
}

Map<String, dynamic> _$CartSubtotalToJson(CartSubtotal instance) =>
    <String, dynamic>{
      'total': instance.total,
      'total_weight': instance.totalWeight,
      'original_total': instance.originalTotal,
      'discount_amount': instance.discountAmount,
      'count': instance.count,
    };

CartDialog _$CartDialogFromJson(Map<String, dynamic> json) {
  return CartDialog(
    json['dialog'] as bool,
    (json['data'] as List<dynamic>?)
        ?.map((e) => CartGroup.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..goods = json['goods'] == null
        ? null
        : Product.fromJson(json['goods'] as Map<String, dynamic>)
    ..checkoutButton = json['checkout_button'] == null
        ? null
        : CartButton.fromJson(json['checkout_button'] as Map<String, dynamic>)
    ..promotionCell = (json['promotion_cell'] as List<dynamic>?)
        ?.map((e) => CartCell.fromJson(e as Map<String, dynamic>))
        .toList()
    ..subtotal = json['subtotal'] == null
        ? null
        : CartSubtotal.fromJson(json['subtotal'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CartDialogToJson(CartDialog instance) =>
    <String, dynamic>{
      'dialog': instance.dialog,
      'goods': instance.goods,
      'checkout_button': instance.checkoutButton,
      'data': instance.data,
      'promotion_cell': instance.promotionCell,
      'subtotal': instance.subtotal,
    };

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    (json['data'] as List<dynamic>)
        .map((e) => CartGroup.fromJson(e as Map<String, dynamic>))
        .toList(),
    CartSubtotal.fromJson(json['subtotal'] as Map<String, dynamic>),
  )
    ..checkoutButton = json['checkout_button'] == null
        ? null
        : CartButton.fromJson(json['checkout_button'] as Map<String, dynamic>)
    ..promotionCell = (json['promotion_cell'] as List<dynamic>?)
        ?.map((e) => CartCell.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'checkout_button': instance.checkoutButton,
      'data': instance.data,
      'promotion_cell': instance.promotionCell,
      'subtotal': instance.subtotal,
    };
