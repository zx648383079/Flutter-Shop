import 'package:flutter/material.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/pages/index/search_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> historyItems = <String>[];
  List<String> hotKeywords = <String>[];
  List<String> tipItems = <String>[];

  @override
  void initState() {
    super.initState();
    ProductApi.getHotKeywords((res) {
      setState(() {
        tipItems = res.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: SearchAppBar(
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        tapSuggestion(value);
                      },
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('取消'),
                  ),
                )
              ],
            ),
          ),
        ),
        body: showTips(),
      ),
    );
  }

  void tapSuggestion(String value) {
    ProductApi.getTips(value, (res) {
      setState(() {
        tipItems = res.data == null ? [] : res.data;
      });
    });
  }

  Widget showTips() {
    if (tipItems.length < 1) {
      return showHistory();
    }
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(tipItems[index]),
        ),
      ),
      itemCount: tipItems.length,
    );
  }

  Widget showHistory() {
    var children = <Widget>[];
    if (historyItems.length > 0) {
      children.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('历史记录'),
          IconButton(
            icon: Icon(IconFont.trash),
            onPressed: () {
              setState(() {
                historyItems.clear();
              });
            },
          )
        ],
      ));
      children.add(Wrap(
        children: historyItems
            .map((e) => Container(
                  child: Text(e),
                ))
            .toList(),
      ));
    }
    if (hotKeywords.length > 0) {
      children.add(Container(
        child: Text('热门搜索'),
      ));
      children.add(Wrap(
        children: historyItems
            .map((e) => Container(
                  child: Text(e),
                ))
            .toList(),
      ));
    }
    return ListView(
      children: children,
    );
  }
}
