import 'package:json_annotation/json_annotation.dart';

part 'site.g.dart';

@JsonSerializable()
class Site extends Object {
  String name;
  String version;
  String logo;
  int goods;
  int category;
  int brand;
  String currency;

  Site(this.name, this.version, this.logo, this.goods, this.category,
      this.brand, this.currency);

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  Map<String, dynamic> toJson() => _$SiteToJson(this);
}
