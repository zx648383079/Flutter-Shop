import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/site.dart';
import 'package:flutter_shop/models/emoji.dart';
import 'package:path_provider/path_provider.dart';

typedef void SelectionChanged(Emoji emoji);

class EmojiContainer extends StatefulWidget {
  final SelectionChanged? onSelected;
  EmojiContainer({Key? key, this.onSelected}) : super(key: key);

  @override
  _EmojiContainerState createState() => _EmojiContainerState();
}

class _EmojiContainerState extends State<EmojiContainer> {
  List<EmojiCategory>? data;
  int category = -1;

  @override
  void initState() {
    super.initState();
    getOrSet().then((value) {
      setState(() {
        data = value;
        if (value.length > 0) {
          category = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: buildEmoji(),
          ),
          buildCategory(),
        ],
      ),
    );
  }

  Widget buildEmoji() {
    if (this.data == null ||
        this.category < 0 ||
        this.category >= this.data!.length) {
      return Container();
    }
    var items = this.data![this.category].items;
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (context, i) {
        var item = items[i];
        return InkWell(
          child: item.type < 1
              ? CachedNetworkImage(imageUrl: item.content)
              : Text(item.content),
          onTap: () {
            if (widget.onSelected != null) {
              widget.onSelected!(item);
            }
          },
        );
      },
      itemCount: items.length,
    );
  }

  Widget buildCategory() {
    if (this.data == null) {
      return Container();
    }
    return ListView.builder(
      itemBuilder: (context, i) {
        var cat = this.data![i];
        if (i == category) {
          return Text(cat.name);
        }
        return InkWell(
          child: Text(cat.name),
          onTap: () {
            setState(() {
              category = i;
            });
          },
        );
      },
      itemCount: this.data!.length,
    );
  }

  Future<List<EmojiCategory>> getOrSet() async {
    var path = await getTemporaryDirectory();
    var file = File("${path.path}/emoji.json");
    if (file.existsSync()) {
      var str = file.readAsStringSync();
      if (str.isNotEmpty) {
        var data = json.decode(str);
        if (data['data'] != null) {
          return (data['data'] as List<dynamic>)
              .map((e) => EmojiCategory.fromJson(e))
              .toList();
        }
      }
    }
    Completer<List<EmojiCategory>> completer = Completer();
    SiteApi.emoji((str) {
      if (str.isEmpty) {
        completer.complete([]);
        return;
      }
      file.writeAsStringSync(str);
      var data = json.decode(str);
      if (data['data'] == null) {
        completer.complete([]);
        return;
      }
      completer.complete((data['data'] as List<dynamic>)
          .map((e) => EmojiCategory.fromJson(e))
          .toList());
    });
    return await completer.future;
  }
}
