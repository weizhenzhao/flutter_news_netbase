import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_netbase/part2/RecentPage.dart';
import 'package:flutter_news_netbase/part2/model/NewsModel.dart';

class HomeItemListPage extends StatefulWidget {
  @override
  _HomeItemListPageState createState() => _HomeItemListPageState();
}

// 需要的字段
// title标题
// infos介绍
// tag标签 (置顶、、独家等)专题
// source 新闻来源 (报社，电台，电视台，网站，自媒体等)
// type类型 (可以用来判断item选用哪一种布局类型)
// thumb小图
// images 新闻配图(可能为空，也可能是多张)
// commentCount 评论数量 (跟帖)
// votecount 点赞数量
// replyCount 转发数量
class _HomeItemListPageState extends State<HomeItemListPage> {
  List<Widget> children;



  @override
  Widget build(BuildContext context) {


//    return ListView(
//      children: children,
//    );
    return FutureBuilder(
      future: rootBundle.loadString('assets/news.json'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //将数据封装成模型类，通过模型类来管理数据
          NewsModel model = newsModuleFromJson(snapshot.data);

          for (int i = 0; i < model.data.length; i++) {
            Data bean = model.data[i];

            //根据返回值动态添加UI
            switch (bean.type) {
              case "1":
                Widget widget = buildItem1(bean);
                children.add(widget);
                children.add(
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                );
                break;
              case "2":
                Widget widget2 = buildItem2(bean);
                children.add(widget2);
                children.add(
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                );
                break;
              case "3":
                Widget widget3 = buildItem3(bean);
                children.add(widget3);
                children.add(
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                );
                break;
            }
          }

          return ListView(
            children: children,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    children = <Widget>[];
    children.add(RecentPage());
  }

  Widget buildItem1(Data bean) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            bean.title,
            style: TextStyle(fontSize: 17),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: buildTagText(bean),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  bean.source,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
              buildCommentCountText(bean.commentCount),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTagText(Data bean) {
    if (bean.tag != null) {
      return Text(
        bean.tag,
        style: TextStyle(fontSize: 10, color: Colors.red),
      );
    } else {
      return Text('');
    }
  }

  Widget buildCommentCountText(String commentCount) {
    if (int.parse(commentCount) >= 2000) {
      return Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Text(
          '${commentCount}跟帖',
          style: TextStyle(fontSize: 10, color: Colors.red),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: Text(
          '${commentCount}跟帖',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      );
    }
  }

  Widget buildItem2(Data bean) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bean.title,
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: buildTagText(bean),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Text(
                        bean.source,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                    buildCommentCountText(bean.commentCount),
                  ],
                ),
              ],
            ),
            flex: 7,
          ),
          Expanded(
            child: Image.asset(
              bean.thumb,
              width: 110,
              height: 80,
              fit: BoxFit.fill,
            ),
            flex: 4,
          )
        ],
      ),
    );
  }

  Widget buildItem3(Data bean) {

    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            bean.title,
            style: TextStyle(fontSize: 17),
          ),
          Row(
            children: buildImages(width, bean),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: buildTagText(bean),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Text(
                  bean.source,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
              buildCommentCountText(bean.commentCount),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> buildImages(double width, Data bean) {
    List<Widget> children = bean.images.map((urls) {
      if (bean.images.length == 1) {
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Image.asset(
            urls.imgsrc,
            width: width - 20,
            height: 150,
            fit: BoxFit.fill,
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
          child: Image.asset(
            urls.imgsrc,
            width: (width - 50) / 3,
            height: 100,
            fit: BoxFit.fill,
          ),
        );
      }
    }).toList();

    return children;
  }
}
