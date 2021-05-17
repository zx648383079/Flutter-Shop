import 'package:flutter/material.dart';
import 'package:flutter_shop/api/bulletin.dart';
import 'package:flutter_shop/models/bulletin.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../iconfont.dart';

class SystemMessagePage extends StatefulWidget {
  SystemMessagePage({Key? key}) : super(key: key);

  @override
  _SystemMessagePageState createState() => _SystemMessagePageState();
}

class _SystemMessagePageState extends State<SystemMessagePage> {
  List<BulletinUser> items = <BulletinUser>[];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  final refreshController = RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    this.tapRefresh();
  }

  void tapRefresh() {
    tapPage(1, (suc) {
      refreshController.refreshCompleted();
    });
  }

  void tapMore() {
    if (!hasMore) {
      refreshController.loadComplete();
      return;
    }
    tapPage(page + 1, (suc) {
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
      {'page': p},
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
        finish(true);
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
          color: Colors.white,
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                child: Center(
                  child: Text(
                    item.bulletin.icon,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff41C4FF),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: infoItem(item),
              ),
            ],
          ),
        );
      },
      itemCount: items.length,
    );
  }

  Widget infoItem(BulletinUser item) {
    var infoBox = Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            '${item.bulletin.userName} ${item.bulletin.createdAt}',
            style: TextStyle(
              color: Color(0xff999999),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: 60,
          ),
          alignment: Alignment.topLeft,
          child: Text(item.bulletin.title),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: InkWell(
            child: Text(
              '点击查看',
              style: TextStyle(
                color: Color(0xff999999),
              ),
            ),
          ),
        ),
      ],
    );
    if (item.status > 0) {
      return infoBox;
    }
    return Stack(
      children: <Widget>[
        infoBox,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            child: Transform.rotate(
              angle: 20,
              child: Text(
                '未读',
                style: TextStyle(
                  color: Color(0x33000000),
                  fontSize: 40,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
