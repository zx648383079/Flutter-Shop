import 'package:flutter/material.dart';
import 'package:flutter_shop/api/bulletin.dart';
import 'package:flutter_shop/models/bulletin.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../iconfont.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<BulletinUser> items = <BulletinUser>[];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  final refreshController = RefreshController(initialRefresh: false);

  void tapRefresh() {
    tapPage(1, () {
      refreshController.refreshCompleted();
    });
  }

  void tapMore() {
    if (!hasMore) {
      refreshController.loadComplete();
      return;
    }
    tapPage(page + 1, () {
      refreshController.loadComplete();
    });
  }

  void tapPage(int p, Function finish) {
    if (isLoading) {
      finish(true);
      return;
    }
    isLoading = true;
    BulletinApi.getList(
      PageForm(
        p,
      ),
      (res) {
        setState(() {
          page = p;
          isLoading = false;
          hasMore = res.paging.more;
          if (p < 2) {
            items = res.data;
          } else {
            items.addAll(res.data);
          }
        });
      },
    );
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
        title: Text('我的消息'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: hasMore,
        controller: refreshController,
        onLoading: tapMore,
        onRefresh: tapRefresh,
        child: showMessage(context),
      ),
    );
  }

  Widget showMessage(BuildContext context) {
    if (items.length < 1) {
      return Container(
        child: Center(
          child: Text('暂无消息'),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = items[index];
        return Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(item.bulletin.icon),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                            '[${item.bulletin.userName}] ${item.bulletin.createdAt}'),
                        Container(
                          child: Text(item.bulletin.title),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text('点击查看'),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        child: Text(item.status < 1 ? '未读' : '已读'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: items.length,
    );
  }
}
