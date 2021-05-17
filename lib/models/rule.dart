import 'package:json_annotation/json_annotation.dart';

part 'rule.g.dart';

enum BlockType {
  TEXT,
  USER,
  IMAGE,
  LINK,
  FILE,
  LINE,
}

@JsonSerializable()
class ExtraRule {
  String s;
  int? u;
  String? i;
  String? l;
  String? f;
  int? type;
  ExtraRule(this.s, {this.u, this.i, this.l, this.f, this.type});
  factory ExtraRule.fromJson(Map<String, dynamic> json) =>
      _$ExtraRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraRuleToJson(this);

  BlockItem toBlock() {
    if (i != null) {
      return BlockItem(this.s, type: BlockType.IMAGE, value: this.i);
    }
    if (u != null && u! > 0) {
      return BlockItem(this.s, type: BlockType.USER, value: this.u);
    }
    if (l != null) {
      return BlockItem(this.s, type: BlockType.LINK, value: this.l);
    }
    if (f != null) {
      return BlockItem(this.s, type: BlockType.FILE, value: this.f);
    }
    if (this.type != null && this.type == 99) {
      return BlockItem(this.s, type: BlockType.LINE);
    }
    return BlockItem(
      this.s,
    );
  }
}

class BlockItem {
  BlockType type;
  String content;
  Object? value;
  BlockItem(this.content, {this.type = BlockType.TEXT, this.value});

  BlockItem clone() {
    return BlockItem(this.content, type: this.type, value: this.value);
  }
}
