import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/emoji.dart';

typedef void SendTextEvent(String text);
typedef void SendImageEvent(File file);
typedef void SendAudioEvent(File audioFile, int duration);

class MessageInput extends StatefulWidget {
  final SendTextEvent? onSend;
  final SendImageEvent? onSendImage;
  final SendAudioEvent? onSendAudio;

  MessageInput({Key? key, this.onSend, this.onSendImage, this.onSendAudio})
      : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }

  Widget buildEmojiContainer() {
    return EmojiContainer();
  }

  Widget buildMoreContainer() {
    return GridView.count(
      crossAxisCount: 5,
      children: [
        ElevatedButton.icon(
          onPressed: () => {},
          icon: Icon(Icons.image),
          label: Text('图片'),
        ),
        ElevatedButton.icon(
          onPressed: () => {},
          icon: Icon(Icons.movie),
          label: Text('视频'),
        ),
        ElevatedButton.icon(
          onPressed: () => {},
          icon: Icon(Icons.file_upload),
          label: Text('文件'),
        ),
      ],
    );
  }

  Widget buildInputRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.mic,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(),
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
