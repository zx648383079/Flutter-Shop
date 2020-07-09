import 'package:json_annotation/json_annotation.dart';

part 'article_category.g.dart';

@JsonSerializable()
class ArticleCategory extends Object {
  int id;
  String name;

  ArticleCategory(this.id, this.name);

  factory ArticleCategory.fromJson(Map<String, dynamic> json) =>
      _$ArticleCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleCategoryToJson(this);
}
