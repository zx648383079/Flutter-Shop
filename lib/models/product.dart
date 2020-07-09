import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Object {
  int id;
  String name;
  String thumb;
  double price;
  @JsonKey(name: 'market_price')
  double marketPrice;
  int stock;
  @JsonKey(name: 'is_collect')
  bool isCollect;
  int amount;

  Product(this.id, this.name);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
