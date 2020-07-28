import 'package:flutter/material.dart';

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

Map<String, WidgetBuilder> bindRoutes() {
  return <String, WidgetBuilder>{
    '/category': (context) => IndexPage(
          pageIndex: 1,
        ),
    '/cart': (context) => IndexPage(
          pageIndex: 2,
        ),
    '/cashier': (context) => CashierPage(),
    '/checkin': (context) => CheckInPage(),
    '/collect': (context) => CollectPage(),
    '/goods': (context) => GoodsPage(),
    '/comment': (context) => CommentPage(),
    '/pay': (context) => PayPage(),
    '/member': (context) => IndexPage(
          pageIndex: 3,
        ),
    '/member/profile': (context) => ProfilePage(),
    '/member/edit': (context) => EditProfilePage(),
    '/member/password': (context) => EditPasswordPage(),
    '/message': (context) => MessagePage(),
    '/order': (context) => OrderPage(),
    '/order/detail': (context) => OrderDetailPage(),
    '/login': (context) => LoginPage(),
    '/search': (context) => SearchPage(),
    '/search/result': (context) => SearchResultPage(),
    '/account/cancel': (context) => CancelPage(),
    '/account/connect': (context) => ConnectPage(),
    '/account/driver': (context) => DriverPage(),
    '/address': (context) => AddressPage(),
    '/address/edit': (context) => AddressEditPage(),
    '/address/create': (context) => AddressEditPage(),
    '/authorize': (context) => AuthorizePage(),
    '/history': (context) => HistoryPage(),
    '/article': (context) => ArticlePage(),
    '/article/detail': (context) => ArticleDetailPage(),
    '/feedback': (context) => FeedbackPage(),
  };
}
