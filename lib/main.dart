import 'package:flutter/material.dart';
import './router/index.dart';
import './pages/index/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF05A6B1),
        secondaryHeaderColor: Color(0x05a6b1),
        indicatorColor: Color(0xFFB4282D),
        backgroundColor: Color(0xFFF4F4F4),
      ),
      home: IndexPage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
