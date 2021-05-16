import 'package:json_annotation/json_annotation.dart';

part 'emoji.g.dart';

@JsonSerializable()
class Emoji extends Object {
  int id;
  String name;
  int type;
  String content;

  Emoji(this.id, this.name, this.type, this.content);

  factory Emoji.fromJson(Map<String, dynamic> json) => _$EmojiFromJson(json);

  Map<String, dynamic> toJson() => _$EmojiToJson(this);
}

@JsonSerializable()
class EmojiCategory extends Object {
  int id;
  String name;
  List<Emoji> items;

  EmojiCategory(this.id, this.name, this.items);

  factory EmojiCategory.fromJson(Map<String, dynamic> json) =>
      _$EmojiCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$EmojiCategoryToJson(this);
}
