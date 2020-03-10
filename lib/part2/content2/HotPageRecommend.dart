import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_netbase/part2/content2/HotPageRecommendDetails.dart';
import 'package:flutter_news_netbase/part2/model/HotRecommendModel.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';
import 'package:flutter_news_netbase/part2/utils/NumberUtil.dart';

class HotPageRecommend extends StatefulWidget {
  @override
  _HotPageRecommendState createState() => _HotPageRecommendState();
}

class _HotPageRecommendState extends State<HotPageRecommend> {
  List<Widget> datas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = <Widget>[];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString('assets/hot_recommend.json'),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            HotRecommendModel model = recommendModuleFromJson(snap.data);
            for (int i = 0; i < model.data.length; i++) {
              Data bean = model.data[i];
              Widget widgets = GestureDetector(
                onTap: () {
                  print('点击了独家推荐，进入详情页面');
                  gotoNewPage(context, HotPageRecommendDetails(bean));
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        bean.img,
                        width: width,
                        height: 180,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          bean.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      bean.contents.length != 0
                          ? Container(
                              height: bean.contents == null ? 10 : 60,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                bean.contents,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: buildAuthorInfos(bean),
                      )
                    ],
                  ),
                ),
              );
              datas.add(widgets);
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

  Widget buildAuthorInfos(Data bean) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //用户
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Text(
            bean.source,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
        //评论
        buildCommentCountText(bean),
      ],
    );
  }

  Widget buildCommentCountText(Data data) {
    String result =
        parseNumbers('${data.commentCount}', '跟帖', fractionDigits: 1);
    String results = '';

    if (parseNumber2Int('${data.commentCount}') >= 3000) {
      String input = String.fromCharCodes(Runes('\u{1F525}'));
      results = '${input}${result}';

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
      results = result;
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

  @override
  void dispose() {
    super.dispose();
  }
}
