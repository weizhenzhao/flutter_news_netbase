import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Row(
        children: <Widget>[
          buildContents(
              'assets/images/daily_economic_news.png', 'item1', Colors.red),
          buildContents('assets/images/family_it.png', 'item2', Colors.blue),
          buildContents(
              'assets/images/weekly_chinese_news.png', 'item3', Colors.orange),
          buildContents(
              'assets/images/new_peking_news.png', 'item4', Colors.green),
        ],
      ),
    );
  }

  Widget buildContents(String path, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset(
                path,
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              backgroundColor: color,
              radius: 30,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }
}
