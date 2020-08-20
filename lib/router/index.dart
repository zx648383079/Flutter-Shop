import 'package:flutter/material.dart';

import '../pages/browser/index.dart';
import '../pages/comment/index.dart';
import '../pages/article/index.dart';
import '../pages/article/detail.dart';
import '../pages/feedback/index.dart';
import '../pages/goods/history.dart';
import '../pages/collect/index.dart';
import '../pages/index/index.dart';
import '../pages/address/edit.dart';
import '../pages/address/index.dart';
import '../pages/authorize/index.dart';
import '../pages/cashier/index.dart';
import '../pages/cashier/pay.dart';
import '../pages/checkin/index.dart';
import '../pages/goods/index.dart';
import '../pages/member/edit.dart';
import '../pages/member/password.dart';
import '../pages/message/index.dart';
import '../pages/order/detail.dart';
import '../pages/order/index.dart';
import '../pages/search/index.dart';
import '../pages/search/result.dart';
import '../pages/account/driver.dart';
import '../pages/account/connect.dart';
import '../pages/account/cancel.dart';
import '../pages/member/login.dart';
import '../pages/member/profile.dart';

final routes = {
  '/': (context) => IndexPage(
        pageIndex: 0,
      ),
  '/category': (context) => IndexPage(
        pageIndex: 1,
      ),
  '/cart': (context) => IndexPage(
        pageIndex: 2,
      ),
  '/cashier': (context) => CashierPage(),
  '/checkin': (context) => CheckInPage(),
  '/collect': (context) => CollectPage(),
  '/goods': (context, {arguments}) => GoodsPage(arguments: arguments),
  '/comment': (context, {arguments}) => CommentPage(arguments: arguments),
  '/pay': (context, {arguments}) => PayPage(arguments: arguments),
  '/member': (context) => IndexPage(
        pageIndex: 3,
      ),
  '/member/profile': (context) => ProfilePage(),
  '/member/edit': (context, {arguments}) =>
      EditProfilePage(arguments: arguments),
  '/member/password': (context) => EditPasswordPage(),
  '/message': (context) => MessagePage(),
  '/order': (context, {arguments}) => OrderPage(arguments: arguments),
  '/order/detail': (context, {arguments}) =>
      OrderDetailPage(arguments: arguments),
  '/login': (context) => LoginPage(),
  '/search': (context) => SearchPage(),
  '/search/result': (context, {arguments}) =>
      SearchResultPage(arguments: arguments),
  '/account/cancel': (context) => CancelPage(),
  '/account/connect': (context) => ConnectPage(),
  '/account/driver': (context) => DriverPage(),
  '/address': (context) => AddressPage(),
  '/address/edit': (context, {arguments}) =>
      AddressEditPage(arguments: arguments),
  '/address/create': (context) => AddressEditPage(),
  '/authorize': (context, {arguments}) => AuthorizePage(arguments: arguments),
  '/history': (context) => HistoryPage(),
  '/article': (context) => ArticlePage(),
  '/article/detail': (context, {arguments}) =>
      ArticleDetailPage(arguments: arguments),
  '/feedback': (context) => FeedbackPage(),
  '/browser': (context, {arguments}) => BrowserPage(arguments: arguments),
};

//固定写法：
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //统一处理：
  final String name = settings.name;
  final Function pageContentBuilder =
      routes.containsKey(name) ? routes[name] : routes['/'];
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  }
  final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
  return route;
}
