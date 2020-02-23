import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {
  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('圈子-广场'),
      ),
      body: buildGridView(),
    );
  }

  Widget buildGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.4,
      ),
      children: <Widget>[
        buildItems('assets/images/daily_economic_news.png','每日经济新闻','28.1w关注'),
        buildItems('assets/images/family_it.png','IT之家','33.1w关注'),
        buildItems('assets/images/new_peking_news.png','新北京新闻','34.1w关注'),
        buildItems('assets/images/weekly_chinese_news.png','中国新闻周报','35.1w关注'),
        buildItems('assets/images/daily_economic_news.png','每日经济新闻','28.1w关注'),
        buildItems('assets/images/family_it.png','IT之家','33.1w关注'),
        buildItems('assets/images/new_peking_news.png','新北京新闻','34.1w关注'),
        buildItems('assets/images/weekly_chinese_news.png','中国新闻周报','35.1w关注'),
        buildItems('assets/images/daily_economic_news.png','每日经济新闻','28.1w关注'),
        buildItems('assets/images/family_it.png','IT之家','33.1w关注'),
        buildItems('assets/images/new_peking_news.png','新北京新闻','34.1w关注'),
        buildItems('assets/images/weekly_chinese_news.png','中国新闻周报','35.1w关注'),
      ],
    );
  }

  Widget buildItems(String path,String text2,String text3) {
//    return Padding(
//      padding: const EdgeInsets.all(10.0),
//      child: ClipRRect(
//        borderRadius: BorderRadius.circular(10.0),//圆角矩形
//        child: Image.asset(
//          path,
//          fit: BoxFit.fitHeight,
//        ),
//      ),
//    );
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), //圆角矩形
                child: Image.asset(
                  path,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            //第二部分
//        Padding(
//          padding: const EdgeInsets.all(13),
//          child: Align(
//            alignment: Alignment.topRight,
//            child: Icon(
//              Icons.add_circle,
//              color: Colors.red,
//              size: 20,
//            ),
//          ),
//        )
            Positioned(
              top: 10,
              right: 13,
              child: Icon(
                Icons.add_circle,
                color: Colors.red,
                size: 20,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text3,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
