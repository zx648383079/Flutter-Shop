import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/rule.dart';
import 'package:flutter_shop/utils/rule.dart';

typedef void RuleBlockEvent(BlockItem item);

class RuleContainer extends StatelessWidget {
  final String? content;
  final List<ExtraRule>? rules;
  final RuleBlockEvent? onTapped;
  final double fontSize;
  const RuleContainer(
      {Key? key, this.content, this.rules, this.onTapped, this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = LinkRule.render(this.content, this.rules, true);
    var children = <InlineSpan>[];
    for (var item in items) {
      if (item.type == BlockType.LINE) {
        children.add(TextSpan(
          text: '\n',
          style: TextStyle(
            fontSize: this.fontSize,
          ),
        ));
        continue;
      }
      if (item.type == BlockType.TEXT) {
        children.add(TextSpan(
          text: item.content,
          style: TextStyle(
            fontSize: this.fontSize,
          ),
        ));
        continue;
      }
      if (item.type == BlockType.LINK || item.type == BlockType.USER) {
        children.add(TextSpan(
            text: item.content,
            style: TextStyle(
              fontSize: this.fontSize,
              color: Color(0x0269c8),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (this.onTapped != null) {
                  this.onTapped!(item);
                }
              }));
        continue;
      }
      if (item.type == BlockType.IMAGE) {
        children.add(WidgetSpan(
            child: CachedNetworkImage(
          width: 1.5 * this.fontSize,
          height: 1.5 * this.fontSize,
          imageUrl: item.value.toString(),
        )));
      }
    }
    return RichText(
      text: TextSpan(children: children),
    );
  }
}
