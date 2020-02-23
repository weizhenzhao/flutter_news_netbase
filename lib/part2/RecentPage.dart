import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '最近浏览',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            trailing: Container(
              width: 100,
              child: GestureDetector(
                onTap: () {
                  print('进入我的关注页面');
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      '查看我的关注',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildContents(
                  'assets/images/daily_economic_news.png', 'item1', Colors.red),
              buildContents(
                  'assets/images/family_it.png', 'item2', Colors.blue),
              buildContents('assets/images/weekly_chinese_news.png', 'item3',
                  Colors.orange),
              buildContents(
                  'assets/images/new_peking_news.png', 'item4', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContents(String path, String text, Color color) {
    return GestureDetector(
      onTap: () {
        print('进入了item的点击事件');
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Image.asset(
                      path,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                    backgroundColor: color,
                    radius: 30,
                  ),
                ),
                Positioned(
                  right: 18,
                  bottom: 10,
                  child: Container(
                    width: 13,
                    height: 13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: Text(
                      '★',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                text == 'item2'
                    ? Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          width: 13,
                          height: 13,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Text(
                            'V',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
