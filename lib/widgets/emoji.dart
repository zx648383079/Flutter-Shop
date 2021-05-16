import 'package:flutter/material.dart';
import 'package:flutter_shop/models/emoji.dart';

typedef void SelectionChanged(Emoji emoji);

class EmojiContainer extends StatefulWidget {
  EmojiContainer({Key? key}) : super(key: key);

  @override
  _EmojiContainerState createState() => _EmojiContainerState();
}

class _EmojiContainerState extends State<EmojiContainer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
