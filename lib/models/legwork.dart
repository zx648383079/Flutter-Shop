import 'package:json_annotation/json_annotation.dart';

part 'legwork.g.dart';

@JsonSerializable()
class LegworkForm extends Object {
  String name;
  String label;
  bool? required;
  bool? only;
  String? value;

  LegworkForm(this.name, this.label);

  factory LegworkForm.fromJson(Map<String, dynamic> json) =>
      _$LegworkFormFromJson(json);

  Map<String, dynamic> toJson() => _$LegworkFormToJson(this);
}

@JsonSerializable()
class LegworkService extends Object {
  int id;
  String name;
  String thumb;
  String brief;
  String content;
  double price;
  List<LegworkForm>? form;

  LegworkService(
      this.id, this.name, this.thumb, this.brief, this.content, this.price);

  factory LegworkService.fromJson(Map<String, dynamic> json) =>
      _$LegworkServiceFromJson(json);

  Map<String, dynamic> toJson() => _$LegworkServiceToJson(this);
}

@JsonSerializable()
class LegworkOrder extends Object {
  int id = 0;
  @JsonKey(name: 'user_id')
  int userId = 0;
  @JsonKey(name: 'service_id')
  int serviceId = 0;
  List<LegworkForm>? remark;
  @JsonKey(name: 'order_amount')
  double orderAmount = 0;
  int runner = 0;
  int status = 0;
  @JsonKey(name: 'service_rank')
  int? serviceRank;
  @JsonKey(name: 'pay_at')
  String? payAt;
  @JsonKey(name: 'taking_at')
  String? takingAt;
  @JsonKey(name: 'taken_at')
  String? takenAt;
  @JsonKey(name: 'finish_at')
  String? finishAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  LegworkOrder();

  factory LegworkOrder.fromJson(Map<String, dynamic> json) =>
      _$LegworkOrderFromJson(json);

  Map<String, dynamic> toJson() => _$LegworkOrderToJson(this);
}
