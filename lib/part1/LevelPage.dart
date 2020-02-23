import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text('等级介绍'),
      ),
      body: Column(
        children: <Widget>[
          buildTitle(context),
          buildContents(context, '科员', Icons.star_border, '0', '0'),
          buildContents(context, '科员', Icons.star_border, '1', '60'),
          buildContents(context, '副科长', Icons.star_border, '2', '300'),
          buildContents(context, '副科长', Icons.star_border, '3', '600'),
          buildContents(context, '科员', Icons.star_border, '4', '900'),
          buildContents(context, '科员', Icons.star_border, '5', '1400'),
          buildContents(context, '副科长', Icons.star_border, '6', '2100'),
          buildContents(context, '副科长', Icons.star_border, '7', '4200'),
          buildContents(context, '科员', Icons.star_border, '8', '6300'),
          buildContents(context, '科员', Icons.star_border, '9', '9400'),
          buildContents(context, '副科长', Icons.star_border, '10', '12600'),
          buildContents(context, '副科长', Icons.star_border, '11', '15700'),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    //根据context获取屏幕的宽度
    double width = MediaQuery.of(context).size.width / 4 - 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        //文本
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              '等级头衔',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              '等级头衔',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              '等级图标',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              '等级',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              '所需积分',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContents(BuildContext context, String text, IconData icon,
      String level, String score) {
    //根据context获取屏幕的宽度
    double width = MediaQuery.of(context).size.width / 4 - 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //文字
        Container(
          width: width,
          child: Center(child: Text(text)),
          padding: EdgeInsets.symmetric(horizontal: 5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: new Border.all(
                color: Colors.red,
                width: 1.0,
              )),
        ),
        //图标
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Icon(
            icon,
            size: 20,
            color: Colors.red,
          ),
        ),
        //文本
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(level),
          ),
        ),
        //积分
        Container(
          width: width,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(level),
          ),
        ),
      ],
    );
  }
}
