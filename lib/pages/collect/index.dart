import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/collect.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../iconfont.dart';

class CollectPage extends StatefulWidget {
  CollectPage({Key? key}) : super(key: key);

  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  List<Collect> items = <Collect>[];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
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
    UserApi.collectList(
      PageForm(p),
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
        title: Text('我的关注'),
      ),
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
    return Slidable(
      key: UniqueKey(),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: item.goods.thumb,
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
                      item.goods.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      item.goods.price.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(), 
        children: <Widget>[
        SlidableAction(
          label: '删除',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (context) {
            UserApi.removeCollect(item.id, (res) {
              items.removeAt(index);
              setState(() {});
            });
          },
        ),
      ],
      ),
    );
  }
}
