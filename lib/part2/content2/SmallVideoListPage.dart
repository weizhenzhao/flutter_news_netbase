import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/model/SmallVideoModel.dart';
import 'package:flutter_news_netbase/part2/content2/VideoPage.dart';
import 'package:flutter_news_netbase/part2/gestures/GestureUtil.dart';

class SmallVideoListPage extends StatefulWidget {
  Data data;

  SmallVideoListPage(this.data);

  @override
  _SmallVideoListPageState createState() => _SmallVideoListPageState();
}

class _SmallVideoListPageState extends State<SmallVideoListPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
//      appBar: new AppBar(
//        title: Text('视频详情页'),
//      ),
      body: Builder(
        builder: (BuildContext contexts) {
          return Container(
            width: width,
            height: height,
            child: Stack(
              children: <Widget>[
                VideoPage(widget.data.url),
                buildAboveContents1(contexts),
                buildAboveContents2(widget.data),
                buildAboveContents3(widget.data),
                buildAboveContents4(width, 45)
              ],
            ),
          );
        },
      ),
    );
  }

  // 评论框
  // 修改4 把输入框 封装成一个类 StatefulWidget
  Widget buildAboveContents4(double width, double height) {
    return Positioned(
      bottom: 12,
      //left: ,
      right: 10,
      child: EditableTextView(width, height),
    );
  }

  Widget buildAboveContents1(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildGesture(
            () {
              Navigator.of(context).pop();
            },
            Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          buildGesture(
            () {
              showBottomSheetViews(context);
            },
            Container(
              child: Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildAboveContents2(Data data) {
    return Positioned(
      bottom: 80,
      right: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.thumb_up,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            child: Text(
              '${data.votecount}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.chat,
                size: 30,
              )),
          Container(
            padding: EdgeInsets.all(0),
            child: Text(
              '${data.commentCount}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.call_made,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
              padding: EdgeInsets.all(0),
              child: Text(
                '分享',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }

  // 视频作者 ID  关注
  Widget buildAboveContents3(Data data) {
    return Positioned(
      bottom: 60,
      left: 10,
      right: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: ClipOval(
                  child: Image.network(
                    '${data.img}',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  '${data.source}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              buildGesture(
                () {
                  print('点击了关注');
                },
                Container(
                  width: 45,
                  height: 25,
                  margin: EdgeInsets.all(5),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    border: new Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              '${data.title}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheetItems(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 35,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }

  showBottomSheetViews(BuildContext context) {
    Scaffold.of(context).showBottomSheet((BuildContext contexts) {
      return Container(
        color: Colors.white10,
        height: 150,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //                buildBottomSheetItems(Icons.star_border, '收藏'),
                //                buildBottomSheetItems(Icons.visibility_off, '不感兴趣'),
                //                buildBottomSheetItems(Icons.error_outline, '我要报错'),

                buildGesture(
                  () {
                    print('点击了 收藏');
                  },
                  buildBottomSheetItems(Icons.star_border, '收藏'),
                ),
                buildGesture(
                  () {
                    print('点击了 不感兴趣');
                  },
                  buildBottomSheetItems(Icons.visibility_off, '不感兴趣'),
                ),
                buildGesture(
                  () {
                    print('点击了 我要报错');
                  },
                  buildBottomSheetItems(Icons.error_outline, '我要报错'),
                ),
              ],
            ),

            //            Container(
            //              height: 56,
            //              color: Colors.white,
            //              child: Center(
            //                child: Text(
            //                  '关闭',
            //                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //                ),
            //              ),
            //            ),

            buildGesture(
              () {
                print('点击了关闭');
                Navigator.of(context).pop();
              },
              Container(
                height: 50,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '关闭',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class EditableTextView extends StatefulWidget {
  double width;
  double height;

  EditableTextView(this.width, this.height);

  @override
  EditableTextViewState createState() => new EditableTextViewState();
}

class EditableTextViewState extends State<EditableTextView> {
  TextEditingController _controller;
  bool autoFocus = false;

  // 焦点
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    focusNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: widget.width / 12 * 9,
            height: widget.height,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new TextFormField(
              focusNode: focusNode,
              autofocus: false,
              controller: _controller,
              keyboardType: TextInputType.text,
              minLines: 1,
//              maxLines: 5,
              style: TextStyle(color: Colors.white, fontSize: 12),
//              textAlign: TextAlign.start,
              //              onTap: () {
              //                // 点击时获取焦点
              //                FocusScope.of(context).requestFocus(focusNode);
              //              },
              //              onFieldSubmitted: (data) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey[200],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey[400],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: '我来说两句',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
          buildGesture(
            () {
              print('点击了发送，发送的内容是：${_controller.text.toString()}');
            },
            Container(
              width: 35,
              height: 25,
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              decoration: new BoxDecoration(
                color: Colors.grey,
                border: new Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  '发送',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }
}
