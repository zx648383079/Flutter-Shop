import 'dart:io';

import 'package:dio/dio.dart';

import '../models/login.dart';

import '../models/user.dart';
import '../utils/http.dart';
import '../models/search.dart';
import '../models/collect.dart';
import '../models/page.dart';

class UserApi {
  static void get(Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.get<Map<String, dynamic>>('auth/user', success: (res) {
      success(User.fromJson(res));
    }, error: error);
  }

  static void collectList(PageForm search, Function(CollectPage res) success,
      [Function(int code, String message) error]) {
    RestClient.get<Map<String, dynamic>>('shop/collect', data: search.toJson(),
        success: (res) {
      success(CollectPage.fromJson(res));
    }, error: error);
  }

  static void toggleCollect(int id, Function(ResponseBool store) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('shop/collect/toggle',
        data: {'id': id}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void removeCollect(int id, Function(ResponseBool store) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<Map<String, dynamic>>('shop/collect/delete?id=$id',
        success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void login(Login form, Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/login', data: form.toJson(),
        success: (res) {
      success(User.fromJson(res));
    }, error: error);
  }

  static void logout(Function(ResponseBool res) success) async {
    RestClient.post<Map<String, dynamic>>('auth/logout', success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: (code, message) {
      success(ResponseBool(false));
    });
  }

  static void register(Register form, Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/register', data: form.toJson(),
        success: (res) {
      success(User.fromJson(res));
    }, error: error);
  }

  static void sendFindEmail(String email, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/password/send_find_email',
        data: {'email': email}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void sendMobileCode(
      String mobile, String type, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/password/send_mobile_code',
        data: {'mobile': mobile, 'type': type}, success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void resetPassword(ResetForm form, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/password/reset',
        data: form.toJson(), success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void updatePassword(
      PasswordForm form, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/password/update',
        data: form.toJson(), success: (res) {
      success(ResponseBool.fromJson(res));
    }, error: error);
  }

  static void update(Map<String, dynamic> data, Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.post<Map<String, dynamic>>('auth/user/update', data: data,
        success: (res) {
      success(User.fromJson(res));
    }, error: error);
  }

  static void updateAvatar(File image, Function(User user) success,
      [Function(int code, String message) error]) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    RestClient.uploadFile<Map<String, dynamic>>(
        'auth/user/avatar',
        FormData.fromMap(
            {'file': await MultipartFile.fromFile(path, filename: name)}),
        success: (res) {
      success(User.fromJson(res));
    }, error: error);
  }
}
