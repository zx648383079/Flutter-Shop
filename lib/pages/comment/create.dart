import 'package:flutter/material.dart';

import '../../iconfont.dart';

class CommentCreatePage extends StatefulWidget {
  final Map arguments;
  CommentCreatePage({Key? key, required this.arguments}) : super(key: key);

  @override
  _CommentCreatePageState createState() => _CommentCreatePageState();
}

class _CommentCreatePageState extends State<CommentCreatePage> {
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
        title: Text('评价晒单'),
      ),
      body: Container(),
    );
  }
}
