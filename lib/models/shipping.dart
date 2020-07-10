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

@JsonSerializable()
class ShippingData extends Object {
  List<Shipping> data;

  ShippingData(this.data);

  factory ShippingData.fromJson(Map<String, dynamic> json) =>
      _$ShippingDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingDataToJson(this);
}
