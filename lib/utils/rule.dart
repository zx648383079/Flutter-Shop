import 'package:flutter_shop/models/rule.dart';

class LinkRule {
  static List<BlockItem> render(String? content, List<ExtraRule>? rules,
      [bool newLine = false]) {
    if (content == null || content.isEmpty) {
      return <BlockItem>[];
    }
    var items = <BlockItem>[BlockItem(content)];
    if (newLine) {
      items = splitArr(items, ExtraRule('\n', type: 99));
    }
    if (rules != null) {
      for (var rule in rules) {
        items = splitArr(items, rule);
      }
    }
    return items;
  }

  static List<BlockItem> splitArr(List<BlockItem> items, ExtraRule rule) {
    var data = <BlockItem>[];
    var block = rule.toBlock();
    for (var item in items) {
      if (item.type != BlockType.TEXT) {
        data.add(item);
        continue;
      }
      var lines = item.content.split(rule.s);
      for (int i = 0; i < lines.length; i++) {
        if (i > 0) {
          data.add(block.clone());
        }
        var line = lines[i];
        if (line.isEmpty) {
          continue;
        }
        data.add(new BlockItem(line));
      }
    }
    return data;
  }
}
