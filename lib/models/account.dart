import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountLog extends Object {
  int id;
  int type;
  @JsonKey(name: 'item_id')
  int itemId;
  double money;
  int status;
  String remark;
  @JsonKey(name: 'created_at')
  String createdAt;

  AccountLog(this.id, this.money);

  factory AccountLog.fromJson(Map<String, dynamic> json) =>
      _$AccountLogFromJson(json);

  Map<String, dynamic> toJson() => _$AccountLogToJson(this);
}

@JsonSerializable()
class Card extends Object {
  int id;
  int type;
  String icon;
  String bank;
  @JsonKey(name: 'card_no')
  String cardNo;
  int status;
  @JsonKey(name: 'created_at')
  String createdAt;

  Card(this.id, this.type);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
