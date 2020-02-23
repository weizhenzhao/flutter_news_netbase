import 'package:flutter/material.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  bool init_value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text('账号设置'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              '账号',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            trailing: Text(
              'weizhen_zhao@163.com',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),

//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),

          ListTile(
            title: Text(
              '绑定手机号',
            ),
            subtitle: Text(
              '绑定成功后可通过手机号快速登录',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '去绑定',
                    style: TextStyle(color: Colors.red),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),

//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),

          ListTile(
            title: Text(
              '头像',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset('assets/images/daily_economic_news.png'),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),

//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),
          ListTile(
            title: Text(
              '昵称',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child:  Row(
//                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '有态度的网友阿伟',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 20,
                      color: Colors.grey[400],
                    )
                  ],
                ),


            ),
          ),

//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),
          ListTile(
            title: Text(
              '生日',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '1980-01-01',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),

//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),
          ListTile(
            title: Text(
              '生日',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '1980-01-01',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),
//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),
          ListTile(
            title: Text(
              '性别',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '男',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),
//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),
          SwitchListTile(
            value: init_value,
            onChanged: (bool value) {
              setState(() {
                init_value = !init_value;
              });
            },
            subtitle: Text(
              '其他网友不会看到你的用户名，头像和个人主页',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),

          ListTile(
            title: Text(
              '跟帖设备名称',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '小米8',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),
//          Divider(
//            thickness: 1,
//            color: Colors.grey[300],
//          ),

          ListTile(
            title: Text(
              '我的等级',
            ),
            trailing: Container(
              width: 80,
              height: 80,
              child: Row(
//                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'LV0 跟帖局科员',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 20,
                      color: Colors.grey[400],
                    )
                  ],
                ),

            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(30.0)),
            child: Center(
              child: Text(
                '登出',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
