import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../iconfont.dart';

class CommentPage extends StatefulWidget {
  final Map arguments;
  CommentPage({Key key, this.arguments}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> statusItems = ['待评价', '已评价'];
  int tabIndex = 0;
  List<OrderGoods> items = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  final refreshController = RefreshController(initialRefresh: false);
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: statusItems.length,
      vsync: ScrollableState(),
    );
    tabController.addListener(() {
      tabIndex = tabController.index;
      tapRefresh();
    });
    tapRefresh();
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
    OrderApi.getCommentGoods(
      {'page': p, 'status': tabIndex},
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
      appBar: header(context),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: hasMore,
        controller: refreshController,
        onLoading: tapMore,
        onRefresh: tapRefresh,
        child: ListView.builder(
          itemBuilder: (context, index) => productItem(context, index),
          itemCount: items.length,
        ),
      ),
    );
  }

  Widget productItem(BuildContext context, int index) {
    var item = items[index];
    var child = Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: item.thumb,
            width: 100.0,
            height: 100.0,
            placeholder: (context, url) => new Icon(
              Icons.image,
              color: Colors.grey[300],
              size: 100.0,
            ),
            errorWidget: (context, url, error) => new Icon(
              Icons.image,
              color: Colors.grey[300],
              size: 100.0,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    if (tabIndex > 0) {
      return child;
    }
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          bottom: 0,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/comment/create',
                  arguments: {'goods': item.id});
            },
            child: Text('评价'),
          ),
        ),
      ],
    );
  }

  Widget header(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(IconFont.chevronLeft),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text('评价管理'),
      bottom: TabBar(
        tabs: statusItems
            .map((e) => Container(
                  height: 30,
                  child: Text(
                    e,
                  ),
                ))
            .toList(),
        controller: tabController,
      ),
    );
  }
}
