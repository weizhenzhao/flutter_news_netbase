import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_netbase/part2/model/HotCommentModel.dart';
import 'package:flutter_news_netbase/part2/content2/HotPageCommentDetails.dart';
import 'package:flutter_news_netbase/part2/utils/NumberUtil.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';

class HotPageComment extends StatefulWidget {
  @override
  _HotPageCommentState createState() => _HotPageCommentState();
}

class _HotPageCommentState extends State<HotPageComment> {
  List<Widget> datas;

  @override
  void initState() {
    super.initState();
    datas = <Widget>[];
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString('assets/hot_comment.json'),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            HotCommentModel model = hotCommentModelFromJson(snap.data);
            for (int i = 0; i < model.data.length; i++) {
              Data bean = model.data[i];
              Widget widget = buildItem1(bean,width);
              datas.add(widget);
              datas.add(Divider(
                height: 10,
                color: Colors.grey[400],
              ));
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

  Widget buildItem1(Data data, double width,{bool showHotComments = true}) {
    return GestureDetector(
      onTap: () {
        print('点击了实时热榜，进入详情页');
        gotoNewPage(context, HotPageCommentDetails(data));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //排序
//            Align(
//              alignment: Alignment.centerLeft,
//              child: buildTitles(data),
//            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //标题
                      Align(
                          alignment: Alignment.centerLeft,
                          child: buildTitleInfos(data)),
                      showHotComments == true
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: _buildAvatars(data),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: //右侧图片
                      Image.asset(
                    data.img,
                    width: 150,
                    height: 75,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            //最后一部分，热帖
            buildLastContents(width, data),
          ],
        ),
      ),
    );
  }

  Widget buildLastContents(double width, Data data) {
    List<Color> colors1 = [
      Colors.red,
      Colors.redAccent,
      Colors.orange,
      Colors.orangeAccent,
    ];

    return Container(
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: width,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.fromLTRB(45, 5, 0, 5),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
              child: Text(
                '${data.hotCommontPost}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            child: buildTitle(
              colors1,
              Offset(0, 0),
              45,
              0,
              '热帖',
              Colors.white
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAvatars(Data data) {
    List<Widget> children = <Widget>[];

    Widget text = Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Text(
        '网友热议中',
        style: TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
    children.add(text);

    List<Widget> children2 = data.hotcommontImages.map((img) {
      return ClipOval(
        child: Image.network(
          img.avatar,
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        ),
      );
    }).toList();
    children.addAll(children2);
    return children;
  }

  Widget buildTitles(Data data) {
    List<Color> colors = [
      Colors.red,
      Colors.redAccent,
      Colors.orange,
      Colors.orangeAccent,
    ];

    List<Color> colors2 = [
      Colors.grey[200],
      Colors.grey[200],
      Colors.grey[200],
    ];

    String results = parseNumbers(data.hotPoints, '万热度');

    int ids = parseNumber2Int(data.articleId);

    return Stack(
      children: <Widget>[
        Positioned(
          child: buildTitle(colors2, Offset(27.5, 0), 150, 15, results,
              ids >= 4 ? Colors.orange : Colors.red),
        ),
        Positioned(
          child: buildTitle(ids >= 4 ? colors2 : colors, Offset(0, 0), 40, 0,
              data.articleId, Colors.white),
        )
      ],
    );
  }

  Widget buildTitleInfos(Data data) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        data.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget buildCommentCountText(Data data) {
    String result =
        parseNumbers('${data.commentCount}', '跟帖', fractionDigits: 1);
    int ids = parseNumber2Int('${data.articleId}');
    String results = result;
    //前3位
    if (ids <= 3) {
      String input = String.fromCharCodes(Runes('\u{1F525}'));
      results = '${input} ${result}';
    } else {
      results = '${result}';
    }
    if (parseNumber2Int('${data.commentCount}') >= 3000) {
      return Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(5),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.red, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          results,
          style: TextStyle(fontSize: 10, color: Colors.red),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: Text(
          results,
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      );
    }
  }

  Widget buildTitle(List<Color> colors, Offset startPoint, double width,
      double left, String text, Color textColor) {
    return ClipPath(
      clipper: MyCustomClipper(startPoint, width, 25),
      child: Container(
        width: width,
        height: 25,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(3),
            bottomLeft: Radius.circular(3),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(left, 0, 0, 0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  Offset startPoint;

  double width;

  double height;

  MyCustomClipper(this.startPoint, this.width, this.height);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(width, 0.0); //宽
    path.lineTo(width - 12.5, height); //宽度-12.5
    path.lineTo(startPoint.dx, height);
    path.lineTo(startPoint.dx + 12.5, 0.0); //起始点的x坐标+12.5
    path.close(); //把路径关闭
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
