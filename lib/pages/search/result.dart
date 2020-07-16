import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:flutter_shop/pages/index/search_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchResultPage extends StatefulWidget {
  SearchResultPage({Key key}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  List<Product> items = <Product>[];
  String keywords = '';
  int category = 0;
  int brand = 0;
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
    ProductApi.getList(
      SearchForm(p, keywords: keywords, brand: brand, category: category),
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
    return Container(
      child: Scaffold(
        appBar: SearchAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(IconFont.home),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(),
              ),
            ],
          ),
        ),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: hasMore,
          controller: refreshController,
          onLoading: tapMore,
          onRefresh: tapRefresh,
          child: ListView.builder(
            itemBuilder: (context, index) => product(context, items[index]),
            itemCount: items.length,
          ),
        ),
      ),
    );
  }

  Widget product(BuildContext context, Product item) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: item.thumb,
            placeholder: (context, url) => new Icon(
              Icons.image,
              color: Colors.grey[300],
              size: MediaQuery.of(context).size.width / 2 - 60,
            ),
            errorWidget: (context, url, error) => new Icon(
              Icons.image,
              color: Colors.grey[300],
              size: MediaQuery.of(context).size.width / 2 - 60,
            ),
          ),
          Container(height: 5.0),
          Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: <Widget>[
              Text(
                "￥" + item.price.toString(),
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
              Text(
                "￥" + item.marketPrice.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
