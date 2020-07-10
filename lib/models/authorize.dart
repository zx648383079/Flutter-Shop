import 'package:json_annotation/json_annotation.dart';

part 'authorize.g.dart';

@JsonSerializable()
class QrAction extends Object {
  String token;
  bool confirm;
  bool reject;

  QrAction();

  factory QrAction.fromJson(Map<String, dynamic> json) =>
      _$QrActionFromJson(json);

  Map<String, dynamic> toJson() => _$QrActionToJson(this);
}

@JsonSerializable()
class QrToken extends Object {
  int id;
  int status;
  @JsonKey(name: 'created_at')
  String createdAt;

  QrToken();

  factory QrToken.fromJson(Map<String, dynamic> json) =>
      _$QrTokenFromJson(json);

  Map<String, dynamic> toJson() => _$QrTokenToJson(this);
}
