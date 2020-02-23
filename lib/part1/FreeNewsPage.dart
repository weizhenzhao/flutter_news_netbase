import 'package:flutter/material.dart';

class FreeNewsPage extends StatefulWidget {
  @override
  _FreeNewsPageState createState() => _FreeNewsPageState();
}

class _FreeNewsPageState extends State<FreeNewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('免流量看新闻'),
      ),
      body: buildContents(),
    );
  }

  Widget buildContents() {
    return Column(
      children: <Widget>[
        buildCards('白金卡', Colors.indigo, '电信', '内容1.。。。。。。。。', '内容2.。。。。。。。。'),
        buildCards('乐卡', Colors.red, '联通', '内容2.。。。。。。。。', '内容2.。。。。。。。。'),
        buildCards(
            '态度包', Colors.lightBlue, '移动', '内容3.。。。。。。。。。', '内容3.。。。。。。。。。'),
        buildCards('流量包', Colors.red, '联通', '内容4.。。。。。。。。。。', '内容4.。。。。。。。。。。'),
      ],
    );
  }

  Widget buildCards(
      String title1, Color color, String title2, String title3, String title4) {
    return Stack(
      children: <Widget>[
        Card(
          elevation: 5, //阴影
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8), //圆角矩形
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title1,
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          title2,
                          style: TextStyle(
                            color: Colors.grey[50],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  title3,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  title4,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 260,
          top: 50,
          width: 90,
          height: 33,
          child: Container(
            child: Center(
              child: Text(
                '立即领取',
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        )
      ],
    );
//
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
