import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/category.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/pages/index/product_item.dart';
import 'package:flutter_shop/pages/index/search_bar.dart';

import '../application.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin<CategoryPage> {
  @override
  bool get wantKeepAlive => true;

  List<Category> categories = <Category>[];
  int selectedIndex = 0;
  int goodsCount = 0;

  @override
  void initState() {
    Application.getSite((res) {
      setState(() {
        goodsCount = res.goods;
      });
    });
    CategoryApi.getList(0, (res) {
      if (res.data == null || res.data.length < 1) {
        return;
      }
      setState(() {
        categories = res.data;
      });
      tapTab(0);
    });
    super.initState();
  }

  void tapTab(int index) {
    if (categories[index].children != null) {
      setState(() {
        selectedIndex = index;
      });
      return;
    }
    categories[index].children = <Category>[];
    categories[index].goodsList = <Product>[];
    CategoryApi.get(categories[index].id, 'goods_list,children', (res) {
      categories[index].fromExtra(res);
      setState(() {
        selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        appBar: header(),
        body: Row(
          children: <Widget>[
            leftBar(context),
            mainBox(context),
          ],
        ),
      ),
    );
  }

  Widget mainBox(BuildContext context) {
    if (categories.length <= selectedIndex) {
      return Container(
        color: Theme.of(context).backgroundColor,
      );
    }
    var items = <Widget>[];
    var item = categories[selectedIndex];
    if (item.appBanner.length > 0) {
      items.add(SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[CachedNetworkImage(imageUrl: item.appBanner)],
        ),
      ));
    }
    if (item.goodsList != null && item.goodsList.length > 0) {
      items.addAll(floor(item.name, item.goodsList));
    }
    if (item.children != null && item.children.length > 0) {
      items.add(
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 1,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int subIndex) {
            return new Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () => {
                      // todo
                    },
                    child: Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          width: 50.0,
                          fit: BoxFit.contain,
                          imageUrl: item.children[subIndex].icon,
                          placeholder: (context, url) => new Icon(
                            Icons.image,
                            color: Colors.grey[300],
                            size: 50.0,
                          ),
                          errorWidget: (context, url, error) => new Icon(
                            Icons.image,
                            color: Colors.grey[300],
                            size: 50.0,
                          ),
                        ),
                        Text(item.children[subIndex].name)
                      ],
                    ),
                  ),
                ],
              ),
            );
          }, childCount: item.children.length),
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width - 100.0,
      color: Theme.of(context).backgroundColor,
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: items,
      ),
    );
  }

  Widget leftBar(BuildContext context) {
    return Container(
      width: 100.0,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          // 当前选中项
          bool flag = false;
          if (selectedIndex == index) {
            flag = true;
          }
          return InkWell(
            onTap: () {
              tapTab(index);
            },
            child: Container(
              color: flag ? Colors.green[50] : Colors.grey[100],
              height: 44.0,
              child: Center(
                child: Text(categories[index].name,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: flag
                            ? Theme.of(context).primaryColor
                            : Colors.black)),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> floor(String title, List<Product> data) {
    if (data == null || data.length < 1) {
      return <Widget>[];
    }
    return <Widget>[
      SliverFixedExtentList(
        itemExtent: 50,
        delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: Text(title),
              ),
            )
          ],
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return product(context, data[index]);
        }, childCount: data.length),
      ),
    ];
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

  Widget header() {
    return SearchAppBar(
      backgroundColor: Color(0xFF05A6B1),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: InkWell(
          child: Container(
            child: Center(
              child: Text('搜索商品, 共 $goodsCount 款好物'),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFededed),
              borderRadius: BorderRadius.all(
                const Radius.circular(2),
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
      ),
    );
  }
}
