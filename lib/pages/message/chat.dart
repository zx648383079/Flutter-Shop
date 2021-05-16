import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/message/message_input.dart';
import 'package:flutter_shop/pages/message/message_container.dart';

import '../../iconfont.dart';

class ChatPage extends StatefulWidget {
  final Map arguments;
  ChatPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
        title: Text('聊天中'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: MessageContainer(),
            ),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}
