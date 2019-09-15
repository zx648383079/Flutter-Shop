import 'package:flutter/material.dart';
import '../../utils/index.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final String logo = getAssetUrl('/assets/images/wap_logo.png');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(children: <Widget>[
        Image.network(logo),
        Expanded(
          child: Container(
            child: Row(children: <Widget>[
              Icon(Icons.search),
              Text('搜索商品, 共10469款好物')
            ],),
          ),
        ),
        IconButton(icon: Icon(Icons.message), onPressed: () {

        },)
      ],),
    );
  }
}