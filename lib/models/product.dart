import 'package:flutter_shop/models/comment.dart';
import 'package:json_annotation/json_annotation.dart';

import 'page.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Object {
  int id;
  String name;
  String thumb;
  String image;
  double price;
  @JsonKey(name: 'market_price')
  double marketPrice;
  int stock;
  @JsonKey(name: 'is_collect')
  bool isCollect;
  int amount;
  List<CommentImage>? gallery;
  String? content;

  Product(this.id, this.name, this.thumb, this.image, this.price,
      this.marketPrice, this.stock, this.isCollect, this.amount);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductPage extends Object {
  Paging paging;
  List<Product> data;

  ProductPage(this.data, this.paging);

  factory ProductPage.fromJson(Map<String, dynamic> json) =>
      _$ProductPageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPageToJson(this);
}

@JsonSerializable()
class ProductData extends Object {
  List<Product> data;

  ProductData(this.data);

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

@JsonSerializable()
class HomeProduct extends Object {
  @JsonKey(name: 'hot_products')
  List<Product>? hotProducts;

  @JsonKey(name: 'new_products')
  List<Product>? newProducts;

  @JsonKey(name: 'best_products')
  List<Product>? bestProducts;

  HomeProduct();

  factory HomeProduct.fromJson(Map<String, dynamic> json) =>
      _$HomeProductFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProductToJson(this);
}
