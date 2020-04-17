// import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart';

// @JsonSerializable()
// class Paging {
//   int limit;
//   int offset;
//   int total;
//   bool more;

//   Paging(this.limit, this.offset, this.total, this.more);

//   factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

//   Map<String, dynamic> toJson() => _$PagingToJson(this);
// }

// part 'page.g.dart';


// @JsonSerializable(explicitToJson: true)
// class Page<T> {
//   Paging paging;
//   List<T> data;

//   factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

//   Map<String, dynamic> toJson() => _$PageToJson(this);
// }

// part 'baseResponse.g.dart';


// class BaseResponse {
//   String appid;
//   String sign;
//   String signType;
//   String timestamp;
//   String encrypt;
//   String encryptType;

//   factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
// }