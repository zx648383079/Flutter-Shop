// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['id'] as int,
    json['title'] as String,
    json['content'] as String,
    json['rank'] as int,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'rank': instance.rank,
    };

CommentPage _$CommentPageFromJson(Map<String, dynamic> json) {
  return CommentPage(
    (json['data'] as List<dynamic>)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    Paging.fromJson(json['paging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentPageToJson(CommentPage instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'data': instance.data,
    };

CommentImage _$CommentImageFromJson(Map<String, dynamic> json) {
  return CommentImage(
    json['image'] as String,
  );
}

Map<String, dynamic> _$CommentImageToJson(CommentImage instance) =>
    <String, dynamic>{
      'image': instance.image,
    };

CommentTag _$CommentTagFromJson(Map<String, dynamic> json) {
  return CommentTag(
    json['label'] as String,
    json['count'] as int,
  );
}

Map<String, dynamic> _$CommentTagToJson(CommentTag instance) =>
    <String, dynamic>{
      'label': instance.label,
      'count': instance.count,
    };

CommentSubtotal _$CommentSubtotalFromJson(Map<String, dynamic> json) {
  return CommentSubtotal(
    json['total'] as int,
    json['good'] as int,
    json['middle'] as int,
    json['bad'] as int,
    (json['avg'] as num).toDouble(),
    (json['favorableRate'] as num).toDouble(),
    (json['tags'] as List<dynamic>)
        .map((e) => CommentTag.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['comments'] as List<dynamic>)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CommentSubtotalToJson(CommentSubtotal instance) =>
    <String, dynamic>{
      'total': instance.total,
      'good': instance.good,
      'middle': instance.middle,
      'bad': instance.bad,
      'avg': instance.avg,
      'favorableRate': instance.favorableRate,
      'tags': instance.tags,
      'comments': instance.comments,
    };
