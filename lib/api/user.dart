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
    RestClient.get<User>('auth/user', success: success, error: error);
  }

  static void collectList(PageForm search, Function(CollectPage res) success,
      [Function(int code, String message) error]) {
    RestClient.get<CollectPage>('shop/collect',
        data: search.toJson(), success: success, error: error);
  }

  static void toggleCollect(int id, Function(ResponseBool store) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('shop/collect/toggle',
        data: {'id': id}, success: success, error: error);
  }

  static void removeCollect(int id, Function(ResponseBool store) success,
      [Function(int code, String message) error]) async {
    RestClient.delete<ResponseBool>('shop/collect/delete?id=$id',
        success: success, error: error);
  }

  static void login(Login form, Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.post<User>('auth/login',
        data: form.toJson(), success: success, error: error);
  }

  static void logout(Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('auth/logout',
        success: success, error: error);
  }

  static void register(Register form, Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.post<User>('auth/register',
        data: form.toJson(), success: success, error: error);
  }

  static void sendFindEmail(String email, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('auth/password/send_find_email',
        data: {'email': email}, success: success, error: error);
  }

  static void sendMobileCode(
      String mobile, String type, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('auth/password/send_mobile_code',
        data: {'mobile': mobile, 'type': type}, success: success, error: error);
  }

  static void resetPassword(ResetForm form, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('auth/password/reset',
        data: form.toJson(), success: success, error: error);
  }

  static void updatePassword(
      PasswordForm form, Function(ResponseBool res) success,
      [Function(int code, String message) error]) async {
    RestClient.post<ResponseBool>('auth/password/update',
        data: form.toJson(), success: success, error: error);
  }

  static void update(Map<String, dynamic> data, Function(User user) success,
      [Function(int code, String message) error]) async {
    RestClient.post<User>('auth/user/update',
        data: data, success: success, error: error);
  }

  static void updateAvatar(File image, Function(User user) success,
      [Function(int code, String message) error]) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    RestClient.uploadFile<User>(
        'auth/user/avatar',
        FormData.fromMap(
            {'file': await MultipartFile.fromFile(path, filename: name)}),
        success: success,
        error: error);
  }
}
