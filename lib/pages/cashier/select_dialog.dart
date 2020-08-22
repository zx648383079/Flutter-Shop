import 'dart:async';
import 'package:flutter/material.dart';

import '../../iconfont.dart';

Future<dynamic> showSelectDialog(BuildContext context,
    {List<dynamic> items, int selected, String title}) {
  Completer<dynamic> completer = Completer();
  var result = showModalBottomSheet(
    context: context,
    builder: (context) {
      return Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(IconFont.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    children: items.map((e) {
                      var child = selected == e.id
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red, width: 1),
                                color: Color(0xfff8d1d1),
                              ),
                              child: Text(
                                e.name,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffcccccc), width: 1),
                              ),
                              child: Text(e.name),
                            );
                      return InkWell(
                        child: child,
                        onTap: () {
                          Navigator.pop(context, e);
                        },
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    },
  );
  result.then((v) {
    completer.complete(v);
  });
  return completer.future;
}
