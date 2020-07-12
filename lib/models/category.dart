import 'package:flutter_shop/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Object {
  int id;
  String name;
  String icon;
  String banner;
  @JsonKey(name: 'app_banner')
  String appBanner;
  @JsonKey(name: 'parent_id')
  int parentId;
  bool expanded;
  int level;
  List<Category> children;
  @JsonKey(name: 'goods_list')
  List<Product> goodsList;

  Category(this.id, this.name, this.icon, this.appBanner, this.parentId);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryData extends Object {
  List<Category> data;

  CategoryData(this.data);

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
