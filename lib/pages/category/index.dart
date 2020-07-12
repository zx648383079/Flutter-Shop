import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/category.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/pages/index/search_bar.dart';

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

  @override
  Future initState() async {
    CategoryApi.getList(0, (res) {
      setState(() {
        categories = res.data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        appBar: header(),
        body: Row(
          children: <Widget>[
            leftBar(),
            mainBox(),
          ],
        ),
      ),
    );
  }

  Widget mainBox() {
    return Container(
      width: MediaQuery.of(context).size.width - 100.0,
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int subIndex) {
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
                            imageUrl: categories[selectedIndex]
                                .children[subIndex]
                                .icon,
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
                          Text(
                              categories[selectedIndex].children[subIndex].name)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: categories[selectedIndex].children.length),
          ),
        ],
      ),
    );
  }

  Widget leftBar() {
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
                setState(() {
                  selectedIndex = index;
                });
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
        ));
  }

  Widget header() {
    return SearchAppBar(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          color: Color(0xFFFFFFF),
          child: Center(
            child: Text('搜索商品, 共0款好物'),
          ),
        ),
      ),
    );
  }
}
