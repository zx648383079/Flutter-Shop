import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../iconfont.dart';

class BrowserPage extends StatefulWidget {
  final Map? arguments;
  BrowserPage({Key? key, this.arguments}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
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
        title: Text('浏览器'),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.arguments?['url'],
        ),
      ),
    );
  }
}
