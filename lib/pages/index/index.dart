import "package:flutter/material.dart";
import '../../utils/index.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final String logo = getAssetUrl('/assets/images/wap_logo.png');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Shop'),
          leading: Image.network(logo),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {

            },),
            IconButton(icon: Icon(Icons.message), onPressed: () {

            },)
          ],
        ),
      )
    );
  }
}