# flutter_shop

flutter 版商城客户端

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 配置

复制 `lib/config/config.sample.dart` 为 `lib/config/config.dart`

修改 `config.dart` 的内容

## model 生成

```shell
flutter pub run build_runner build --delete-conflicting-outputs

```

## 无法获取包

新增两个环境变量

```
PUB_HOSTED_URL ===== https://pub.flutter-io.cn
FLUTTER_STORAGE_BASE_URL ===== https://storage.flutter-io.cn
```

## 更新依赖

先把依赖的版本号 换为 `any`

执行 `flutter pub upgrade` 

正式发布时，请改回版本号