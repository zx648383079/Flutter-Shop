// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['id'] as int,
    json['title'] as String,
    json['thumb'] as String,
    json['url'] as String,
    json['content'] as String,
  )
    ..description = json['description'] as String?
    ..createdAt = json['created_at'] as String?;
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumb': instance.thumb,
      'url': instance.url,
      'content': instance.content,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

ArticlePage _$ArticlePageFromJson(Map<String, dynamic> json) {
  return ArticlePage(
    (json['data'] as List<dynamic>)
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList(),
    Paging.fromJson(json['paging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticlePageToJson(ArticlePage instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'data': instance.data,
    };

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return ArticleData(
    (json['data'] as List<dynamic>)
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArticleDataToJson(ArticleData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SearchForm _$SearchFormFromJson(Map<String, dynamic> json) {
  return SearchForm(
    json['page'] as int,
    json['category'] as int,
    json['keywords'] as String,
  );
}

Map<String, dynamic> _$SearchFormToJson(SearchForm instance) =>
    <String, dynamic>{
      'page': instance.page,
      'category': instance.category,
      'keywords': instance.keywords,
    };
