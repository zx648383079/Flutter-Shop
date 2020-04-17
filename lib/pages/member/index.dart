import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  _MemberPageState() {
    UserApi.get((user) {
      print('error:');
      print(user);
    }, (code, message) {
      print('error:');
      print(code);
      print(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}