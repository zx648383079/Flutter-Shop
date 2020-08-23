import 'dart:async';

import 'package:flutter/material.dart';

Future<bool> showConfirmDilaog(BuildContext context,
    {String title = '提示',
    String message,
    String yesLabel = '确定',
    String cancelLabel = '取消'}) {
  Completer<bool> completer = Completer();
  var result = showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(yesLabel),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        FlatButton(
          child: Text(cancelLabel),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ],
    ),
  );
  result.then((v) {
    completer.complete(v);
  });
  return completer.future;
}
