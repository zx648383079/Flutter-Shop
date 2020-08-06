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

  @override
  void initState() {
    super.initState();
    // var form = ModalRoute.of(context).settings.arguments as SearchForm;
    // keywords = form.keywords;
  }

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
          backgroundColor: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(IconFont.home),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    right: 5,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(IconFont.search),
                              Text(keywords),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(IconFont.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFededed),
                    borderRadius: BorderRadius.all(
                      const Radius.circular(2),
                    ),
                  ),
                ),
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
          child: GridView.builder(
            itemBuilder: (context, index) => product(context, items[index]),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.7,
            ),
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
