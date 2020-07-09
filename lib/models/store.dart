import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store extends Object {
  int id;
  String name;
  String logo;
  @JsonKey(name: 'collect_count')
  int collectCount;
  @JsonKey(name: 'is_collected')
  bool isCollected;

  Store(this.id, this.name, this.logo, this.collectCount, this.isCollected);

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
