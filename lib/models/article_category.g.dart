// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleCategory _$ArticleCategoryFromJson(Map<String, dynamic> json) {
  return ArticleCategory(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ArticleCategoryToJson(ArticleCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ArticleCategoryData _$ArticleCategoryDataFromJson(Map<String, dynamic> json) {
  return ArticleCategoryData(
    (json['data'] as List<dynamic>)
        .map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArticleCategoryDataToJson(
        ArticleCategoryData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
