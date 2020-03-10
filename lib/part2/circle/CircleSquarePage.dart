import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_netbase/part2/utils/NumberUtil.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';
import 'package:flutter_news_netbase/part2/circle/CircleSquarePageDetails.dart';
import 'package:flutter_news_netbase/part2/model/CircleSquareModel.dart';
class CircleSquarePage extends StatefulWidget {
  @override
  _CircleSquarePageState createState() => _CircleSquarePageState();
}

class _CircleSquarePageState extends State<CircleSquarePage> {

  List<Widget> datas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = <Widget>[];
  }

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString('assets/circle_square.json'),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            CircleSquareModel model = circleSquareModelFromJson(snap.data);
            for (int i = 0; i < model.data.length; i++) {
              Data bean = model.data[i];
              Widget widget = buildContents(bean);

              datas.add(widget);

            }

            return ListView(
              children: datas,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildContents(Data data) {
    List<Widget> childrens = <Widget>[];

    for (int j = 0; j < data.contents.length; j++) {
      Contents contents = data.contents[j];
      String followCount =
      parseNumbers('${contents.followCount}', '人关注', fractionDigits: 1);
      Widget child = buildItems(contents.img, contents.title, followCount);
      if(child !=null){
        childrens.add(child);
      }


    }

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Center(
              // 标题
              child: Text(
                data.infos,
                style: TextStyle(
                  fontSize: 13,

                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('点击了圈子广场，进入详情页面');
              gotoNewPage(context, CircleSquarePageDetails(data));
            },
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              childAspectRatio: 1 / 1.3,
              children: childrens,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItems(String path, String text2, String text3) {
    return Container(
      width: 80,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(path,
                      width: 80, height: 80, fit: BoxFit.fill),
                ),
              ),
              Positioned(
                top: 13,
                right: 13,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.red,
                  size: 20,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
              // 描述
              child: Text(
                text2,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 13,
                  // 【全局主题设置】：
//                  color: theme.getThemeData.textTheme.display2.color,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              child: Text(
                text3,
                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
