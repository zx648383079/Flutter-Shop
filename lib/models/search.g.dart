// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageForm _$PageFormFromJson(Map<String, dynamic> json) {
  return PageForm(
    json['page'] as int,
  );
}

Map<String, dynamic> _$PageFormToJson(PageForm instance) => <String, dynamic>{
      'page': instance.page,
    };

SearchForm _$SearchFormFromJson(Map<String, dynamic> json) {
  return SearchForm(
    json['page'] as int,
    json['category'] as int,
    json['keywords'] as String,
  )..brand = json['brand'] as int;
}

Map<String, dynamic> _$SearchFormToJson(SearchForm instance) =>
    <String, dynamic>{
      'page': instance.page,
      'category': instance.category,
      'brand': instance.brand,
      'keywords': instance.keywords,
    };

OrderForm _$OrderFormFromJson(Map<String, dynamic> json) {
  return OrderForm(
    json['page'] as int,
    status: json['status'] as int,
    keywords: json['keywords'] as String,
  );
}

Map<String, dynamic> _$OrderFormToJson(OrderForm instance) => <String, dynamic>{
      'page': instance.page,
      'status': instance.status,
      'keywords': instance.keywords,
    };
