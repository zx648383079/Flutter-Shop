import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';

@JsonSerializable()
class Driver extends Object {
  int id;
  String name;
  @JsonKey(name: 'created_at')
  String createdAt;

  Driver(this.id, this.name, this.createdAt);

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

@JsonSerializable()
class DriverData extends Object {
  List<Driver> data;

  DriverData(this.data);

  factory DriverData.fromJson(Map<String, dynamic> json) =>
      _$DriverDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDataToJson(this);
}
