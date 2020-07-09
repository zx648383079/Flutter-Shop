import 'package:json_annotation/json_annotation.dart';

part 'shipping.g.dart';

@JsonSerializable()
class Shipping extends Object {
  int id;
  String name;
  String icon;

  Shipping(this.id, this.name, this.icon);

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);
}
