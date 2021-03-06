import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable()
class Ad extends Object {
  int id;
  String name;
  int type;
  String url;
  String content;

  Ad(this.id, this.name, this.type, this.url, this.content);

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}

@JsonSerializable()
class AdData extends Object {
  List<Ad> data;

  AdData(this.data);

  factory AdData.fromJson(Map<String, dynamic> json) => _$AdDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdDataToJson(this);
}
