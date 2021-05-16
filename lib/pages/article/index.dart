import 'package:flutter/material.dart';
import 'package:flutter_shop/api/article.dart';
import 'package:flutter_shop/models/article.dart';
import 'package:flutter_shop/models/article_category.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../iconfont.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List<ArticleCategory> categories = [];
  int category = 0;
  String keywords = '';
  List<Article> items = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  bool isExpand = false;
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    categories = [ArticleCategory(0, '全部')];
    ArticleApi.getCategories(0, (res) {
      categories.addAll(res.data);
      setState(() {});
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
    ArticleApi.getList(
      SearchForm(p, category, keywords),
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
        title: Text('文章列表'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: hasMore,
        controller: refreshController,
        onLoading: tapMore,
        onRefresh: tapRefresh,
        child: ListView.builder(
          itemBuilder: (context, index) => articleItem(context, index),
          itemCount: items.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO 弹搜索框
        },
        child: Icon(IconFont.search),
      ),
    );
  }

  Widget articleItem(BuildContext context, int index) {
    var item = items[index];
    return InkWell(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.createdAt ?? '',
                    style: TextStyle(
                      color: Color(0xffcccccc),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              constraints: BoxConstraints(
                minHeight: 80,
              ),
              child: Text(item.description ?? ''),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/article/detail',
            arguments: {'id': item.id});
      },
    );
  }

  Widget tabBar() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: isExpand
                ? Wrap(
                    children: categories.map((e) => tabBarItem(e)).toList(),
                  )
                : ListView.builder(
                    itemBuilder: (context, i) {
                      var cat = categories[i];
                      return tabBarItem(cat);
                    },
                    itemCount: categories.length,
                  ),
          ),
          Container(
            width: 40,
            child: IconButton(
              icon: Icon(
                isExpand ? IconFont.chevronUp : IconFont.chevronDown,
              ),
              onPressed: () {
                setState(() {
                  isExpand = !isExpand;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget tabBarItem(ArticleCategory cat) {
    if (cat.id == category) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
        ),
        child: Text(
          cat.name,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      );
    }
    return InkWell(
      child: Container(
        child: Text(cat.name),
      ),
      onTap: () {
        category = cat.id;
        tapRefresh();
      },
    );
  }
}
