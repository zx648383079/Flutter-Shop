import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Paging extends Object {
  int limit;
  int offset;
  int total;
  bool more;

  Paging(this.limit, this.offset, this.total, this.more);

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// class Page<T> {
//   Paging paging;
//   List<T> data;

//   factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

//   Map<String, dynamic> toJson() => _$PageToJson(this);
// }

// @JsonSerializable(explicitToJson: true)
// class ResponseData<T> {
//   List<T> data;

//   factory ResponseData.fromJson(Map<String, dynamic> json) =>
//       _$ResponseDataFromJson(json);

//   Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
// }

// @JsonSerializable(explicitToJson: true)
// class ResponseOne<T> {
//   T data;

//   factory ResponseOne.fromJson(Map<String, dynamic> json) =>
//       _$ResponseOneFromJson(json);

//   Map<String, dynamic> toJson() => _$ResponseOneToJson(this);
// }

@JsonSerializable()
class BaseResponse extends Object {
  String appid;
  String sign;
  @JsonKey(name: 'sign_type')
  String signType;
  String timestamp;
  String encrypt;
  @JsonKey(name: 'encrypt_type')
  String encryptType;

  BaseResponse(this.appid, this.sign, this.signType, this.timestamp,
      this.encrypt, this.encryptType);

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class ResponseBool extends Object {
  bool data;

  ResponseBool(this.data);

  factory ResponseBool.fromJson(Map<String, dynamic> json) =>
      _$ResponseBoolFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseBoolToJson(this);
}

@JsonSerializable()
class StringData extends Object {
  List<String> data;

  StringData(this.data);

  factory StringData.fromJson(Map<String, dynamic> json) =>
      _$StringDataFromJson(json);

  Map<String, dynamic> toJson() => _$StringDataToJson(this);
}
