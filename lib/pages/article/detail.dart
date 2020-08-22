import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/api/article.dart';
import 'package:flutter_shop/models/article.dart';

import '../../iconfont.dart';

class ArticleDetailPage extends StatefulWidget {
  final Map arguments;
  ArticleDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  Article article;

  @override
  void initState() {
    super.initState();
    ArticleApi.get(widget.arguments['id'], (res) {
      setState(() {
        article = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(''),
      ),
      body: showBox(),
    );
  }

  Widget showBox() {
    if (article == null) {
      return Container();
    }
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          height: 60,
          child: Text(
            article.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          child: Html(data: article.content),
        ),
      ],
    );
  }
}
