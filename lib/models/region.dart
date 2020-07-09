import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable()
class Region extends Object {
  int id;
  String name;
  @JsonKey(name: 'parent_id')
  int parentId;
  @JsonKey(name: 'full_name')
  String fullName;

  Region(this.id, this.name, this.parentId, this.fullName);

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
