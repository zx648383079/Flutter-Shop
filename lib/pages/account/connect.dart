import 'package:flutter/material.dart';
import 'package:flutter_shop/api/account.dart';
import 'package:flutter_shop/models/connect.dart';

import '../../iconfont.dart';

class ConnectPage extends StatefulWidget {
  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  List<Connect> items = <Connect>[];

  @override
  void initState() {
    super.initState();
    AccountApi.getConnect((res) {
      if (res.data == null) {
        return;
      }
      setState(() {
        items = res.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('账户关联'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var item = items[index];
          return Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  child: Icon(formatIcon(item.icon)),
                ),
                Expanded(
                  flex: 1,
                  child: Text(item.name),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                      item.id != null ? '已绑(' + item.nickname + ')' : '未绑定'),
                ),
                Container(
                  width: 50,
                  child: Icon(IconFont.chevronRight),
                ),
              ],
            ),
          );
        },
        itemCount: items.length,
        itemExtent: 40,
      ),
    );
  }

  IconData formatIcon(String name) {
    switch (name) {
      case "qq":
      case "fa-qq":
        return IconFont.qq;
      case "weixin":
      case "wechat":
      case "fa-weixin":
      case "fa-wechat":
        return IconFont.wechat;
      case "alipay":
      case "fa-alipay":
        return IconFont.alipay;
      case "weibo":
      case "fa-weibo":
        return IconFont.weibo;
      case "paypal":
      case "fa-paypal":
        return IconFont.paypal;
      case "github":
      case "fa-github":
        return IconFont.github;
      case "google":
      case "fa-google":
        return IconFont.google;
      default:
        return IconFont.collect;
    }
  }
}
