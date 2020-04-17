import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './index.dart';
import './types.dart';

class RestClient {
    static Dio dio;
    static const int CONNECT_TIMEOUT = 10000;
    static const int RECEIVE_TIMEOUT = 3000;


    static void request<T>(String url, { data, method, Function(T t) success, Function(int code, String message) error }) async {
        data = data ?? {};
        method = method ?? 'GET';
        Dio dio = createInstance();
        try {
            var configs = ApiToken.create();
            data['appid'] = configs.appid;
            data['timestamp'] = configs.timestamp;
            data['sign'] = configs.sign;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var token =  prefs.get(TOKEN_KEY);
            Response response = await dio.request<T>(url, data: data, options: new Options(method: method, headers: {
                'Date': getCurrentTime(),
                "Authorization": "Bearer $token"
            }));
            if (success == null) {
              return;
            }
            success(response.data);
        } on DioError catch (e) {
            if (error == null) {
              return;
            }
            if (e.response == null) {
                error(400, '网络错误');
                return;
            }
            error(e.response.statusCode, e.response.data['message']);
        }
    }

    static void get<T>(String url, {Map data, Function(T t) success, Function(int code, String message) error }) async {
        request<T>(url, data: data, method: 'GET', success: success, error: error);
    }

    static void post<T>(String url, {Map data, Function(T t) success, Function(int code, String message) error}) async {
        request<T>(url, data: data, method: 'POST', success: success, error: error);
    }

    static void put<T>(String url, {Map data, Function(T t) success, Function(int code, String message) error}) async {
        request<T>(url, data: data, method: 'PUT', success: success, error: error);
    }

    static void delete<T>(String url, {Function(T t) success, Function(int code, String message) error}) async {
        request<T>(url, method: 'DELETE', success: success, error: error);
    }

    /// 创建 dio 实例对象
    static Dio createInstance() {
        if (dio == null) {
            /// 全局属性：请求前缀、连接超时时间、响应超时时间

            dio = new Dio(new BaseOptions(
                baseUrl: apiEndpoint,
                connectTimeout: CONNECT_TIMEOUT,
                receiveTimeout: RECEIVE_TIMEOUT,
                headers: {
                    'Content-Type': 'application/vnd.api+json',
                    'Accept': 'application/json',
                },
                responseType: ResponseType.json
            ));
        }

        return dio;
    }
}