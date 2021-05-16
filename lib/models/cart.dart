import 'package:json_annotation/json_annotation.dart';
import 'product.dart';
import 'store.dart';

part 'cart.g.dart';

@JsonSerializable()
class CartItem extends Object {
  int id;
  int amount;
  double price;
  @JsonKey(name: 'is_checked')
  bool isChecked;
  @JsonKey(name: 'goods_id')
  int goodsId;
  @JsonKey(name: 'product_id')
  int productId;
  Product goods;

  CartItem(this.id, this.amount, this.price, this.isChecked, this.goodsId,
      this.productId, this.goods);

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class CartGroup extends Object {
  Store shop;
  String name;
  bool checked;
  @JsonKey(name: 'goods_list')
  List<CartItem> goodsList;

  CartGroup(this.shop, this.name, this.checked, this.goodsList);

  factory CartGroup.fromJson(Map<String, dynamic> json) =>
      _$CartGroupFromJson(json);

  Map<String, dynamic> toJson() => _$CartGroupToJson(this);
}

@JsonSerializable()
class CartButton extends Object {
  String action;
  String text;
  Object? reason;

  CartButton(this.action, this.text);

  factory CartButton.fromJson(Map<String, dynamic> json) =>
      _$CartButtonFromJson(json);

  Map<String, dynamic> toJson() => _$CartButtonToJson(this);
}

@JsonSerializable()
class CartLink extends Object {
  String url;
  String text;

  CartLink(this.url, this.text);

  factory CartLink.fromJson(Map<String, dynamic> json) =>
      _$CartLinkFromJson(json);

  Map<String, dynamic> toJson() => _$CartLinkToJson(this);
}

@JsonSerializable()
class CartCell extends Object {
  @JsonKey(name: 'popup_tip')
  String popupTip;
  CartLink link;

  CartCell(this.popupTip, this.link);

  factory CartCell.fromJson(Map<String, dynamic> json) =>
      _$CartCellFromJson(json);

  Map<String, dynamic> toJson() => _$CartCellToJson(this);
}

@JsonSerializable()
class CartSubtotal extends Object {
  double total;
  @JsonKey(name: 'total_weight')
  double totalWeight;
  @JsonKey(name: 'original_total')
  double originalTotal;
  @JsonKey(name: 'discount_amount')
  double discountAmount;
  int count;

  CartSubtotal(this.total, this.totalWeight, this.originalTotal,
      this.discountAmount, this.count);

  factory CartSubtotal.fromJson(Map<String, dynamic> json) =>
      _$CartSubtotalFromJson(json);

  Map<String, dynamic> toJson() => _$CartSubtotalToJson(this);
}

@JsonSerializable()
class CartDialog extends Object {
  bool dialog;
  Product? goods;
  @JsonKey(name: 'checkout_button')
  CartButton? checkoutButton;
  List<CartGroup>? data;
  @JsonKey(name: 'promotion_cell')
  List<CartCell>? promotionCell;
  CartSubtotal? subtotal;

  CartDialog(this.dialog, this.data);

  factory CartDialog.fromJson(Map<String, dynamic> json) =>
      _$CartDialogFromJson2(json);

  Map<String, dynamic> toJson() => _$CartDialogToJson(this);
}

CartDialog _$CartDialogFromJson2(Map<String, dynamic> json) {
  var dailog = json['dialog'] == null ? false : json['dialog'] as bool;
  return CartDialog(
    dailog,
    !dailog
        ? (json['data'] as List)
            .map((e) => e == null
                ? null
                : CartGroup.fromJson(e as Map<String, dynamic>))
            .toList() as List<CartGroup>?
        : null,
  )
    ..goods = !dailog || json['data'] == null
        ? null
        : Product.fromJson(json['data'] as Map<String, dynamic>)
    ..checkoutButton = !dailog || json['checkout_button'] == null
        ? null
        : CartButton.fromJson(json['checkout_button'] as Map<String, dynamic>)
    ..promotionCell = !dailog
        ? (json['promotion_cell'] as List)
            .map((e) =>
                e == null ? null : CartCell.fromJson(e as Map<String, dynamic>))
            .toList() as List<CartCell>?
        : null
    ..subtotal = !dailog || json['subtotal'] == null
        ? null
        : CartSubtotal.fromJson(json['subtotal'] as Map<String, dynamic>);
}

@JsonSerializable()
class Cart extends Object {
  @JsonKey(name: 'checkout_button')
  CartButton? checkoutButton;
  List<CartGroup> data;
  @JsonKey(name: 'promotion_cell')
  List<CartCell>? promotionCell;
  CartSubtotal subtotal;

  Cart(this.data, this.subtotal);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
