import 'package:json_annotation/json_annotation.dart';

import 'page.dart';

part 'article.g.dart';

@JsonSerializable()
class Article extends Object {
  int id;
  String title;
  String thumb;
  String url;
  String content;

  Article(this.id, this.title, this.thumb, this.url, this.content);

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class ArticlePage extends Object {
  Paging paging;
  List<Article> data;

  ArticlePage(this.data, this.paging);

  factory ArticlePage.fromJson(Map<String, dynamic> json) =>
      _$ArticlePageFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlePageToJson(this);
}

@JsonSerializable()
class ArticleData extends Object {
  List<Article> data;

  ArticleData(this.data);

  factory ArticleData.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDataToJson(this);
}

@JsonSerializable()
class SearchForm extends Object {
  int page;
  int category;
  String keywords;

  SearchForm(this.page, this.category, this.keywords);

  factory SearchForm.fromJson(Map<String, dynamic> json) =>
      _$SearchFormFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFormToJson(this);
}
