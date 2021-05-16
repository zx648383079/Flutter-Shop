import 'package:json_annotation/json_annotation.dart';
import 'region.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Object {
  int id;
  String name;
  String tel;
  @JsonKey(name: 'region_id')
  int regionId;
  @JsonKey(name: 'region_name')
  String? regionName;
  String address;
  @JsonKey(name: 'is_default')
  bool isDefault;
  Region? region;

  Address(this.id, this.name, this.tel, this.regionId, this.address,
      this.isDefault);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class AddressData extends Object {
  List<Address> data;

  AddressData(this.data);

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
