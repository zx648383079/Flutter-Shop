import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment extends Object {
  int id;
  String title;
  String content;
  int rank;

  Comment(this.id, this.title, this.content, this.rank);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class CommentImage extends Object {
  String image;

  CommentImage(this.image);

  factory CommentImage.fromJson(Map<String, dynamic> json) =>
      _$CommentImageFromJson(json);

  Map<String, dynamic> toJson() => _$CommentImageToJson(this);
}

@JsonSerializable()
class CommentTag extends Object {
  String label;
  int count;

  CommentTag(this.label, this.count);

  factory CommentTag.fromJson(Map<String, dynamic> json) =>
      _$CommentTagFromJson(json);

  Map<String, dynamic> toJson() => _$CommentTagToJson(this);
}

@JsonSerializable()
class CommentSubtotal extends Object {
  int total;
  int good;
  int middle;
  int bad;
  double avg;
  double favorableRate;
  List<CommentTag> tags;
  List<Comment> comments;

  CommentSubtotal(this.total, this.good, this.middle, this.bad, this.avg,
      this.favorableRate, this.tags, this.comments);

  factory CommentSubtotal.fromJson(Map<String, dynamic> json) =>
      _$CommentSubtotalFromJson(json);

  Map<String, dynamic> toJson() => _$CommentSubtotalToJson(this);
}
