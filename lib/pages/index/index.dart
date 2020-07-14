import "package:flutter/material.dart";
import 'package:flutter_shop/pages/cart/index.dart';
import 'package:flutter_shop/pages/category/index.dart';
import 'package:flutter_shop/pages/index/home.dart';
import 'package:flutter_shop/pages/member/index.dart';
import '../../iconfont.dart';
import '../../models/bar.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int tabIndex = 0;
  final List<BarItem> nav = <BarItem>[
    BarItem('首页', IconFont.home, HomePage()),
    BarItem('分类', IconFont.table, CategoryPage()),
    BarItem('购物车', IconFont.cart, CartPage()),
    BarItem('我的', IconFont.user, MemberPage()),
  ];

  final pageController = PageController(
    initialPage: 0,
  );

  void onPageTapped(int index) {
    setState(() {
      tabIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView(
          children: nav.map((e) => e.page).toList(),
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
          controller: pageController,
          onPageChanged: onPageTapped,
        ),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      items: nav
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e.icon), title: Text(e.name)))
          .toList(),
      selectedItemColor: Theme.of(context).indicatorColor,
      currentIndex: tabIndex,
      onTap: onPageTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
