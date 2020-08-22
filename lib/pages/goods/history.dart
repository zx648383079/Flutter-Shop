import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/utils/types.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../iconfont.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<int> idItems = [];

  List<Product> items = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      var data = prefs.getString(SET_GOODS_HISTORY);
      if (data == null) {
        return;
      }
      idItems = data
          .split(',')
          .map((e) => int.parse(e))
          .where((element) => element > 0)
          .toList();
      tapRefresh();
    });
  }

  void tapRemove(int id) {
    idItems = idItems.where((element) => element != id).toList();
    items = items.where((element) => element.id != id).toList();
    setHistory();
  }

  void setHistory() {
    SharedPreferences.getInstance().then((prefs) {
      if (idItems.length < 1) {
        prefs.remove(SET_GOODS_HISTORY);
        return;
      }
      prefs.setString(SET_GOODS_HISTORY, idItems.join(','));
    });
  }

  void tapClear() {
    idItems.clear();
    items.clear();
    hasMore = false;
    setHistory();
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
    if (idItems.length < 1) {
      finish(true);
      return;
    }
    isLoading = true;
    ProductApi.getListById(
      {'id': idItems, 'page': p},
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
        actions: [
          IconButton(
            icon: Icon(IconFont.trash),
            onPressed: () {
              showClearTip(context);
            },
          ),
        ],
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
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
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
                    Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '删除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            tapRemove(item.id);
          },
        ),
      ],
    );
  }

  Future showClearTip(BuildContext context) async {
    final action = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('提示'),
        content: Text('清除全部历史记录'),
        actions: <Widget>[
          FlatButton(
            child: Text('确定'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
    if (action == true) {
      tapClear();
    }
  }
}
