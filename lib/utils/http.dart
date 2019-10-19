import 'package:dio/dio.dart';
import './index.dart';

class RestClient {
  static Dio dio;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;


  static request<T>(String url, { data, method, Function action }) async {
    data = data ?? {};
    method = method ?? 'GET';
    Dio dio = createInstance();
    var result;
    try {
      Response response = await dio.request<T>(url, data: data, options: new Options(method: method, headers: {
        'Date': getCurrentTime(),
        'Content-Type': 'application/vnd.api+json',
        'Accept': 'application/json',
      }));

      result = response.data;

      /// 打印响应相关信息
      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print('请求出错：' + e.toString());
    } 

    return result;
  }

  static get<T>(String url, {Map data, Function action}) async {
    return await request<T>(url, data: data, method: 'GET', action: action);
  }

  static post<T>(String url, {Map data, Function action}) async {
    return await request<T>(url, data: data, method: 'POST', action: action);
  }

    /// 创建 dio 实例对象
  static Dio createInstance () {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间

      dio = new Dio();
      dio.options.baseUrl = apiEndpoint;
      dio.options.connectTimeout = CONNECT_TIMEOUT;
      dio.options.receiveTimeout = RECEIVE_TIMEOUT;
    }

    return dio;
  }
}