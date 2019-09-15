class Paging {
  int limit;
  int offset;
  int total;
  bool more;

  Paging({this.limit, this.offset, this.total, this.more});

  Paging.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    total = json['total'];
    more = json['more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['total'] = this.total;
    data['more'] = this.more;
    return data;
  }
}

class Page<T> {
  Paging paging;
  List<T> data;
}

class BaseResponse {
  String appid;
  String sign;
  String signType;
  String timestamp;
  String encrypt;
  String encryptType;
}