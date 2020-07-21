import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/pages/member/icon_label.dart';
import 'package:flutter_shop/pages/member/icon_number.dart';
import 'package:flutter_shop/pages/member/menu_item.dart';
import 'package:flutter_shop/utils/index.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with AutomaticKeepAliveClientMixin<MemberPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
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
              ),
              hr(),
              MenuItem(
                icon: IconFont.etCheckingIn,
                label: '签到',
              ),
              hr(),
              MenuItem(
                icon: IconFont.map,
                label: '我的收货地址',
              ),
              hr(),
              MenuItem(
                icon: IconFont.runner,
                label: '代取件',
              ),
              hr(),
              MenuItem(
                icon: IconFont.runner,
                label: '代取件管理',
              ),
              hr(),
              MenuItem(
                icon: IconFont.history,
                label: '浏览历史',
              ),
              hr(),
              MenuItem(
                icon: IconFont.help,
                label: '帮助',
              ),
              hr(),
              MenuItem(
                icon: IconFont.comment,
                label: '反馈',
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
                count: 99,
              ),
            ),
            Expanded(
              child: IconNumber(
                icon: IconFont.exchange,
                label: '待发货',
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
              ),
            ),
            Expanded(
              child: IconNumber(
                icon: IconFont.comment,
                label: '待评价',
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
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.collect,
              label: '关注',
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.message,
              label: '消息',
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.shield,
              label: '安全',
            ),
          ),
          Expanded(
            child: Iconlabel(
              icon: IconFont.set,
              label: '设置',
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
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              '欢迎你，请登录~',
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
                  getAssetUrl('assets/images/zx.jpg'),
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
}
