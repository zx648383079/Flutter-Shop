import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/region.dart';
import 'package:flutter_shop/models/region.dart';

Future<Region> showRegionPicker(
  BuildContext context, {
  Region initRegion,
}) async {
  Completer<Region> completer = Completer();
  var result = showDialog(
    context: context,
    builder: (c) => RegionPicker(
      initResult: initRegion,
    ),
  );

  result.then((v) {
    completer.complete(v);
  });

  return completer.future;
}

class RegionPicker extends StatefulWidget {
  final Region initResult;
  RegionPicker({
    Key key,
    this.initResult,
  }) : super(key: key);

  @override
  _RegionPickerState createState() => _RegionPickerState();
}

class _RegionPickerState extends State<RegionPicker> {
  Map<int, List<Region>> regionCache = {};
  List<List<Region>> regionItems = [];
  List<int> regionIndex = [];
  List<FixedExtentScrollController> regionController = [];
  void getChildren(int id, Function(List<Region> res) success) {
    if (regionCache.containsKey(id)) {
      success(regionCache[id]);
      return;
    }
    RegionApi.getList(id, (res) {
      regionCache[id] = res.data;
      success(res.data);
    });
  }

  void changeRegion(int column, int index) {
    regionIndex[column] = index;
    if (regionItems[column].length < index) {
      setState(() {});
      return;
    }
    if (column > 1) {
      setState(() {});
      return;
    }
    getChildren(regionItems[column][index].id, (res) {
      regionItems[column + 1] = res;
      regionController[column + 1] =
          FixedExtentScrollController(initialItem: 0);
      changeRegion(column + 1, 0);
    });
  }

  @override
  void initState() {
    super.initState();
    regionIndex = [0, 0, 0];
    regionItems = [[], [], []];
    regionController = [
      FixedExtentScrollController(initialItem: 0),
      FixedExtentScrollController(initialItem: 0),
      FixedExtentScrollController(initialItem: 0),
    ];
    getChildren(0, (res) {
      regionItems[0] = res;
      changeRegion(0, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300.0,
            child: Material(
              child: Column(
                children: <Widget>[
                  buildButtons(),
                  buildPickers(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButtons() {
    Widget buildButton(String text, Function onTap) {
      return CupertinoButton(
        child: Text(text),
        onPressed: onTap,
      );
    }

    return Container(
      color: Colors.white,
      height: 60.0,
      child: Row(
        children: <Widget>[
          buildButton("取消", () {
            Navigator.pop(context);
          }),
          Expanded(
            child: Container(),
          ),
          buildButton("确定", () {
            if (regionIndex.length < 1) {
              return;
            }
            var last = regionIndex.length - 1;
            Navigator.pop(context, regionItems[last][regionIndex[last]]);
          }),
        ],
      ),
    );
  }

  Widget buildPickers() {
    var items = <Widget>[];
    for (var i = 0; i < regionController.length; i++) {
      items.add(Expanded(
        child: CupertinoPicker.builder(
          itemExtent: 40,
          scrollController: regionController[i],
          backgroundColor: Colors.white,
          onSelectedItemChanged: (index) {
            changeRegion(i, index);
          },
          itemBuilder: (context, index) =>
              buildTextItem(regionItems[i][index].name),
          childCount: regionItems[i].length,
        ),
      ));
    }

    return Expanded(
      child: Row(
        children: items,
      ),
    );
  }

  Widget buildTextItem(String text) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14.0),
      ),
    );
  }
}
