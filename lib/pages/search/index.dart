import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index/search_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                    child: TextField(),
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
      ),
    );
  }
}
