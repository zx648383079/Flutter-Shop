import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/member/large_header.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final formKey = GlobalKey<FormState>();
  String name, email, phone, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: LargeHeaderBar(
        title: '留言反馈',
        onBack: () {
          Navigator.pop(context);
        },
        onSubmit: () {
          if (!formKey.currentState.validate()) {
            return;
          }
          formKey.currentState.save();
          // todo
        },
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入称呼',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入称呼';
                }
                return '';
              },
              onSaved: (newValue) => name = newValue,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入邮箱',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入邮箱';
                }
                return null;
              },
              onSaved: (newValue) => email = newValue,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入联系方式',
              ),
              onSaved: (newValue) => phone = newValue,
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: '留言内容',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入留言内容';
                }
                return '';
              },
              onSaved: (newValue) => content = newValue,
            ),
          ],
        ),
      ),
    );
  }
}