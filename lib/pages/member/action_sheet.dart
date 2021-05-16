import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<int> showActionSheet(BuildContext context,
    {String? title, String? message, required List<String> items}) {
  Completer<int> completer = Completer();
  var result = showCupertinoModalPopup(
      context: context,
      builder: (context) {
        var children = <Widget>[];
        for (var i = 0; i < items.length; i++) {
          children.add(
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, i);
              },
              child: Text(items[i]),
            ),
          );
        }

        return CupertinoActionSheet(
          title: title == null ? null : Text(title),
          message: message == null ? null : Text(message),
          actions: children,
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, -1);
            },
            child: Text('取消'),
          ),
        );
      });
  result.then((v) {
    completer.complete(v);
  });

  return completer.future;
}
