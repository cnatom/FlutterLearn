import 'package:demo/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void toTextPage(BuildContext context) {
  Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => TextPage()));
}

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  String longText = "这是一串很长的文字这是一串很长的文字这是一串很长的文字这是一串很长的文字这是一串很长的文字";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2 Text组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //高宽色彩子组件
            Code(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "这是一个Text组件",
                    style: TextStyle(
                        fontSize: 20, //大小
                        color: Colors.blue, //颜色
                        fontWeight: FontWeight.bold //字重
                        ),
                  ),
                ),
                source: '''
Text(
  "这是一个Text组件",
  style: TextStyle(
      //大小
      fontSize: 20, 
      //颜色
      color: Colors.blue, 
      //字重
      fontWeight: FontWeight.bold 
      ),
)
            '''),
            Code(
              child: Text(
                "这是第一行\n这是第二行",
                style: TextStyle(
                  //字间隔
                  letterSpacing: 10,
                ),
              ),
              source: '''
Text(
  "这是第一行\\n这是第二行",
  style: TextStyle(
    //字间隔
    letterSpacing: 10,
  ),
)
''',
            ),
            Code(
              child: Text(longText),
              source: '''
String longText = "这是一串很长的文字这是一串很长的文字这是一串很长的文字这是一串很长的文字这是一串很长的文字";

Text(longText)
              ''',
            ),
            Code(
              child: Text(
                longText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              source: '''
Text(longText,
  //最多1行
  maxLines: 1,
  //超出的部分省略号表示
  overflow: TextOverflow.ellipsis,
)
              ''',
            ),

          ],
        ),
      ),
    );
  }
}
