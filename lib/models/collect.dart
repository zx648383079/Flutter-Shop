import 'package:json_annotation/json_annotation.dart';
import 'product.dart';
import 'page.dart';

part 'collect.g.dart';

@JsonSerializable()
class Collect extends Object {
  int id;
  @JsonKey(name: 'goods_id')
  int goodsId;
  Product goods;

  Collect(this.id, this.goodsId, this.goods);

  factory Collect.fromJson(Map<String, dynamic> json) =>
      _$CollectFromJson(json);

  Map<String, dynamic> toJson() => _$CollectToJson(this);
}

@JsonSerializable()
class CollectPage extends Object {
  Paging paging;
  List<Collect> data;

  CollectPage(this.data, this.paging);

  factory CollectPage.fromJson(Map<String, dynamic> json) =>
      _$CollectPageFromJson(json);

  Map<String, dynamic> toJson() => _$CollectPageToJson(this);
}
