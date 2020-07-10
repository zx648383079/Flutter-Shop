import 'package:json_annotation/json_annotation.dart';

part 'connect.g.dart';

@JsonSerializable()
class Connect extends Object {
  int id;
  String name;
  String icon;
  String vendor;
  String nickname;
  @JsonKey(name: 'created_at')
  String createdAt;

  Connect(this.id, this.name, this.icon, this.vendor, this.nickname,
      this.createdAt);

  factory Connect.fromJson(Map<String, dynamic> json) =>
      _$ConnectFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectToJson(this);
}

@JsonSerializable()
class ConnectData extends Object {
  List<Connect> data;

  ConnectData(this.data);

  factory ConnectData.fromJson(Map<String, dynamic> json) =>
      _$ConnectDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectDataToJson(this);
}
