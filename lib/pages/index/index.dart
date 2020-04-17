import "package:flutter/material.dart";
import 'package:flutter_shop/pages/index/search_bar.dart';
import '../../utils/index.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final String logo = getAssetUrl('/assets/images/wap_logo.png');
  int tabIndex = 0;

  void tabBarTap(int index) {
    setState(() {
      tabIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, '/member');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          backgroundColor: Color(0xFF05A6B1),
        ),
        body: Container(
          child: Text('body'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的'),
            ),
          ],
          selectedItemColor: Color(0xFFB4282D),
          currentIndex: tabIndex,
          onTap: tabBarTap,
        ),
      )
    );
  }
}