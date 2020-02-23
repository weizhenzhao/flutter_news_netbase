import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef SearchCallback = void Function(String data);

class SearchBar extends StatefulWidget {
  SearchBar(Color statusBarColor,
      {Key key, //操作状态有关的，操作状态
      @required this.onCancelSearch, //回调函数
      @required this.onSearchQueryChanged //回调函数
      })
      : super(key: key);

  final VoidCallback onCancelSearch; //系统自带空回调

  final SearchCallback onSearchQueryChanged; //有返回结果的回调函数

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //设置状态栏图标和文字颜色
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: TitleContents(widget.onSearchQueryChanged),
        titleSpacing: 0,
        //文字的边距
        leading: IconButton(
          //左边的导航栏
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
            color: Colors.grey[100],
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class TitleContents extends StatefulWidget {
  TitleContents(this.onSearchQueryChanged);

  SearchCallback onSearchQueryChanged;

  @override
  _TitleContentsState createState() => _TitleContentsState();
}

class _TitleContentsState extends State<TitleContents> {
  TextEditingController _searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            width: 250,
            child: TextField(
              controller: _searchFieldController,

              //键盘类型
              keyboardType: TextInputType.datetime,

              //键盘主题色
              keyboardAppearance: Brightness.light,

              //键盘回车键的按钮类型 （搜索，发送，完成）
              textInputAction: TextInputAction.search,

              //选择键盘输入的类型（英文大写，英文小写，文字，数字等）
              textCapitalization: TextCapitalization.words,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey[400],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey[400],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey[400],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: EdgeInsets.zero,

                ///前缀
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 20,
                ),

                ///后缀
                suffixIcon: InkWell(
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onTap: clearSearhQuery,
                ),

                ///输入框隐藏的提示文本
                hintText: '最劲爆新闻实时推送',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                hintMaxLines: 1,

                enabled: true,

                ///表示要启用文本输入框
              ),

              cursorColor: Colors.red,

              ///表示光标的颜色为红色
              autofocus: true,

              ///是否自动聚焦
              style: TextStyle(color: Colors.black12),
              onChanged: widget.onSearchQueryChanged,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                print('点击了搜索按钮');
              },
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  clearSearhQuery() {
    _searchFieldController.clear();
    widget.onSearchQueryChanged('');
  }
}
