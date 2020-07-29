import 'package:json_annotation/json_annotation.dart';

part 'check.g.dart';

@JsonSerializable()
class CheckIn extends Object {
  int id;
  int running;
  @JsonKey(name: 'created_at')
  String createdAt;
  int type;

  CheckIn(this.id, this.running, this.createdAt, this.type);

  factory CheckIn.fromJson(Map<String, dynamic> json) =>
      _$CheckInFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInToJson(this);
}

@JsonSerializable()
class CheckInData extends Object {
  List<CheckIn> data;

  CheckInData(this.data);

  factory CheckInData.fromJson(Map<String, dynamic> json) =>
      _$CheckInDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInDataToJson(this);
}

@JsonSerializable()
class CheckInOne extends Object {
  CheckIn data;

  CheckInOne(this.data);

  factory CheckInOne.fromJson(Map<String, dynamic> json) =>
      _$CheckInOneFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInOneToJson(this);
}
