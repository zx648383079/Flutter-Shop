import "package:flutter/material.dart";
import './search_bar.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
            child: SearchBar(),
            preferredSize: Size.fromHeight(44),
          ),
      ),
    );
  }
}