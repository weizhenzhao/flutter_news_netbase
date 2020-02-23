import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: new Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: MediaQuery.of(context).padding,
          child: Text('\n 侧滑面板'),
        ),
      ),
      width: width * 4 / 5,
    );
  }
}
