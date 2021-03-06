import 'package:flutter/material.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/pages/member/icon_label.dart';
import 'package:flutter_shop/pages/member/icon_number.dart';
import 'package:flutter_shop/pages/member/menu_item.dart';
import 'package:flutter_shop/utils/index.dart';
import 'package:flutter_shop/utils/types.dart';
import 'package:permission_handler/permission_handler.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key? key}) : super(key: key);
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with AutomaticKeepAliveClientMixin<MemberPage> {
  @override
  bool get wantKeepAlive => true;
  User? user;
  OrderCount? orderSubtotal;

  void loadUser() {
    Application.getUser().then((value) {
      setState(() {
        user = value;
      });
      loadOrder();
    });
  }

  void loadOrder() {
    if (user == null) {
      orderSubtotal = null;
      return;
    }
    OrderApi.getSubtotal((res) {
      setState(() {
        orderSubtotal = res;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: header,
          body: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              menu(),
              orderMenu(),
              MenuItem(
                icon: IconFont.scan,
                label: '扫一扫',
                onTap: () {
                  doIfLogin(scan);
                },
              ),
              hr(),
              MenuItem(
                icon: IconFont.etCheckingIn,
                label: '签到',
                onTap: () {
                  navigateIfLogin(
                    '/checkin',
                  );
                },
              ),
              hr(),
              MenuItem(
                icon: IconFont.map,
                label: '我的收货地址',
                onTap: () {
                  navigateIfLogin(
                    '/address',
                  );
                },
              ),
              hr(),
              // MenuItem(
              //   icon: IconFont.runner,
              //   label: '代取件',
              // ),
              // hr(),
              // MenuItem(
              //   icon: IconFont.runner,
              //   label: '代取件管理',
              // ),
              // hr(),
              MenuItem(
                icon: IconFont.history,
                label: '浏览历史',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/history',
                  );
                },
              ),
              hr(),
              MenuItem(
                icon: IconFont.help,
                label: '帮助',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/article',
                  );
                },
              ),
              hr(),
              MenuItem(
                icon: IconFont.comment,
                label: '反馈',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/feedback',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget hr() {
    return Divider(
      height: 1,
      indent: 10,
      endIndent: 10,
    );
  }

  Widget orderMenu() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: IconNumber(
                icon: IconFont.money,
                label: '待付款',
                count: orderSubtotal?.unPay ?? 0,
                onTap: () {
                  navigateIfLogin(
                    '/order',
                    arguments: {
                      'status': ORDER_STATUS.UN_PAY,
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: IconNumber(
                icon: IconFont.exchange,
                label: '待发货',
                count: orderSubtotal?.paidUnShip ?? 0,
                onTap: () {
                  navigateIfLogin(
                    '/order',
                    arguments: {
                      'status': ORDER_STATUS.PAID_UN_SHIP,
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: IconNumber(
                icon: IconFont.shippingFast,
                label: '待收货',
                count: orderSubtotal?.shipped ?? 0,
                onTap: () {
                  navigateIfLogin(
                    '/order',
                    arguments: {
                      'status': ORDER_STATUS.SHIPPED,
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: IconNumber(
                icon: IconFont.comment,
                label: '待评价',
                count: orderSubtotal?.uncomment ?? 0,
                onTap: () {
                  navigateIfLogin('/comment');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget menu() {
    return Container(
      height: 40,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Iconlabel(
              icon: IconFont.users,
              label: '订单',
              onTap: () {
                navigateIfLogin('/order');
              },
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.collect,
              label: '关注',
              onTap: () {
                navigateIfLogin('/collect');
              },
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.message,
              label: '消息',
              onTap: () {
                navigateIfLogin('/message');
              },
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.shield,
              label: '安全',
              onTap: () {
                navigateIfLogin('/account/connect');
              },
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.set,
              label: '设置',
              onTap: tapProfile,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> header(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        floating: true,
        pinned: true,
        snap: true,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: InkWell(
            onTap: tapProfile,
            child: Text(
              user != null ? '欢迎你，${user!.name}~' : '欢迎你，请登录~',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          background: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: ClipOval(
                child: Image.network(
                  user?.avatar ?? getAssetUrl('assets/images/zx.jpg'),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  Future scan() async {
    if (await Permission.camera.request().isGranted) {
      Navigator.pushNamed(context, '/scan');
    }
  }

  void navigateIfLogin(String route, {Object? arguments}) {
    doIfLogin(() {
      Navigator.pushNamed(context, route, arguments: arguments);
    });
  }

  void tapProfile() {
    doIfLogin(() {
      Navigator.pushNamed(context, '/member/profile').then((value) {
        loadUser();
      });
    });
  }

  void doIfLogin(Function onTap) {
    if (user != null) {
      onTap();
      return;
    }
    Navigator.pushNamed(context, LOGIN_PATH).then((value) {
      if (value == true) {
        loadUser();
      }
    });
  }
}
