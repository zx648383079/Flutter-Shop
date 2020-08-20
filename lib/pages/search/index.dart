import 'package:flutter/material.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/search.dart';
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

  String keywords = '';

  TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
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
          backgroundColor: Theme.of(context).primaryColor,
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    color: Colors.white,
                    child: TextField(
                      controller: searchController,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: '搜索',
                        prefixIcon: Icon(IconFont.search),
                        suffixIcon: keywords.length > 0
                            ? IconButton(
                                icon: Icon(IconFont.close),
                                onPressed: () {
                                  setState(() {
                                    searchController.clear();
                                    tipItems.clear();
                                    keywords = '';
                                  });
                                })
                            : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          keywords = value;
                        });
                        tapSuggestion(value);
                      },
                      onSubmitted: (value) {
                        tapSearch(value);
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
                    child: Text(
                      '取消',
                      style: TextStyle(color: Colors.white),
                    ),
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
    if (value.isEmpty) {
      setState(() {
        tipItems = [];
      });
      return;
    }
    ProductApi.getTips(value, (res) {
      setState(() {
        tipItems = res.data == null ? [] : res.data;
      });
    });
  }

  void tapSearch(String value) {
    Navigator.pushNamed(context, '/search/result',
        arguments: SearchForm(1, keywords: value));
  }

  Widget showTips() {
    if (tipItems.length < 1) {
      return showHistory();
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = tipItems[index];
        return InkWell(
          onTap: () {
            tapSearch(item);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Text(tipItems[index]),
            ),
          ),
        );
      },
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
