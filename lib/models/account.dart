import 'package:json_annotation/json_annotation.dart';

import 'page.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountLog extends Object {
  int id;
  int? type;
  @JsonKey(name: 'item_id')
  int? itemId;
  double money;
  int? status;
  String? remark;
  @JsonKey(name: 'created_at')
  String? createdAt;

  AccountLog(this.id, this.money);

  factory AccountLog.fromJson(Map<String, dynamic> json) =>
      _$AccountLogFromJson(json);

  Map<String, dynamic> toJson() => _$AccountLogToJson(this);
}

@JsonSerializable()
class AccountLogPage extends Object {
  Paging paging;
  List<AccountLog> data;

  AccountLogPage(this.data, this.paging);

  factory AccountLogPage.fromJson(Map<String, dynamic> json) =>
      _$AccountLogPageFromJson(json);

  Map<String, dynamic> toJson() => _$AccountLogPageToJson(this);
}

@JsonSerializable()
class Card extends Object {
  int id;
  int type;
  String? icon;
  String? bank;
  @JsonKey(name: 'card_no')
  String? cardNo;
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;

  Card(this.id, this.type);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}

@JsonSerializable()
class CardPage extends Object {
  Paging paging;
  List<Card> data;

  CardPage(this.data, this.paging);

  factory CardPage.fromJson(Map<String, dynamic> json) =>
      _$CardPageFromJson(json);

  Map<String, dynamic> toJson() => _$CardPageToJson(this);
}

@JsonSerializable()
class AccountSubtotal extends Object {
  double money;
  int integral;
  int? bonus;
  int? coupon;

  AccountSubtotal(this.money, this.integral);

  factory AccountSubtotal.fromJson(Map<String, dynamic> json) =>
      _$AccountSubtotalFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSubtotalToJson(this);
}
