import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';


const apiEndpoint = 'http://101.85.232.187/open/';
const assetUri = 'http://101.85.232.187';
const appId = '11543906547';
const secret = '012e936d3d3653b40c6fc5a32e4ea685';

class ApiToken {
  String appid;
  String timestamp;
  String sign;
  ApiToken(this.appid, this.timestamp, this.sign);

  static ApiToken create() {
    String time = getCurrentTime();
    var content = new Utf8Encoder().convert(appId + time + secret);
    var digest = md5.convert(content);
    return ApiToken(appId, time, hex.encode(digest.bytes));
  }
}

String getAssetUrl(String uri) {
  if (uri == null) {
    return '';
  }
  if (uri.indexOf('//') >= 0) {
    return uri;
  }
  if (uri.startsWith('/')) {
    return assetUri + uri;
  }
  return assetUri + '/' + uri;
}


String getCurrentTime() {
  return formatTime(new DateTime.now());
}

String formatTime(DateTime date) {
  return "${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
}

String twoPad(num i) {
  return i.toString().padLeft(2, '0');
}