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

  Category(this.id, this.name, this.icon, this.appBanner, this.parentId);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
