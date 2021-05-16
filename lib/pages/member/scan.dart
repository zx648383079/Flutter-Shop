import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:scan/scan.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('扫一扫'),
      ),
      body: Container(
        width: 250, // custom wrap size
        height: 250,
        child: ScanView(
          controller: controller,
// custom scan area, if set to 1.0, will scan full area
          scanAreaScale: .7,
          scanLineColor: Colors.green.shade400,
          onCapture: (data) {
            Navigator.pushNamed(context, '/authorize',
                arguments: {'token': data});
          },
        ),
      ),
    );
  }
}
