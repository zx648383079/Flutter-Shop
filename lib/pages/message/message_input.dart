import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/emoji.dart';

typedef void SendTextEvent(String text);
typedef void SendImageEvent(File file);
typedef void SendAudioEvent(File audioFile, int duration);

enum MessageInputMode {
  NONE,
  VOICE,
  EMOJI,
  MORE,
}

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
  MessageInputMode inputMode = MessageInputMode.NONE;
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildColumn(),
    );
  }

  void toggleMode(MessageInputMode mode,
      [MessageInputMode toggleMode = MessageInputMode.NONE]) {
    setState(() {
      inputMode = inputMode == mode ? toggleMode : mode;
    });
  }

  Widget buildColumn() {
    if (inputMode == MessageInputMode.EMOJI) {
      return Column(
        children: [
          buildInputRow(),
          buildEmojiContainer(),
        ],
      );
    }
    if (inputMode == MessageInputMode.MORE) {
      return Column(
        children: [
          buildInputRow(),
          buildMoreContainer(),
        ],
      );
    }
    return buildInputRow();
  }

  Widget buildEmojiContainer() {
    return EmojiContainer(
      onSelected: (emoji) {
        controller!.text += emoji.type < 1 ? "[${emoji.name}]" : emoji.content;
      },
    );
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
              color: inputMode == MessageInputMode.VOICE
                  ? Colors.red
                  : IconTheme.of(context).color,
            ),
            onPressed: () {
              toggleMode(MessageInputMode.VOICE);
            },
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                if (widget.onSend != null) {
                  widget.onSend!(value);
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions_outlined,
            ),
            onPressed: () {
              toggleMode(MessageInputMode.EMOJI);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
            ),
            onPressed: () {
              toggleMode(MessageInputMode.MORE);
            },
          ),
        ],
      ),
    );
  }
}
