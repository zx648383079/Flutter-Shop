import 'package:flutter_shop/models/rule.dart';
import 'package:flutter_shop/models/user_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

enum MessageType { TEXT, IMAGE, VIDEO, VOICE, FILE }

@JsonSerializable()
class MessageBase {
  int id;
  UserItem? user;
  MessageType type;
  String content;
  @JsonKey(name: 'extra_rule')
  List<ExtraRule>? extraRule;
  @JsonKey(name: 'created_at')
  String createdAt;
  MessageBase(this.id, this.type, this.content, this.createdAt,
      {this.extraRule, this.user});
}
