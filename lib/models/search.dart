import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class PageForm extends Object {
  int page;
  // @JsonKey(name: 'per_page')
  // int perPage;

  PageForm(this.page);

  factory PageForm.fromJson(Map<String, dynamic> json) =>
      _$PageFormFromJson(json);

  Map<String, dynamic> toJson() => _$PageFormToJson(this);
}

@JsonSerializable()
class SearchForm extends Object {
  int page;
  int category;
  int brand;
  String keywords;

  SearchForm(this.page, this.category, this.keywords);

  factory SearchForm.fromJson(Map<String, dynamic> json) =>
      _$SearchFormFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFormToJson(this);
}

@JsonSerializable()
class OrderForm extends Object {
  int page;
  int status;
  String keywords;

  OrderForm(this.page, {this.status, this.keywords});

  factory OrderForm.fromJson(Map<String, dynamic> json) =>
      _$OrderFormFromJson(json);

  Map<String, dynamic> toJson() => _$OrderFormToJson(this);
}
