
import 'package:demo/1_container.dart';
import 'package:demo/2_text.dart';
import 'package:demo/3_rowColumn.dart';
import 'package:demo/4_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'module.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("翔工作室Flutter培训讲义 牟金腾"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _help(),
            FlyTitle("培训1 基本组件的使用"),
            _buildButton("1 Container组件", ()=>toContainerPage(context)),
            _buildButton("2 Text组件", ()=>toTextPage(context) ),
            _buildButton("3 常用布局", ()=>toRowColumnPage(context)),
            _buildButton("4 页面的跳转", ()=>toRoutePage(context)),
          ],
        ),
      ),
    );
  }
  Widget _buildButton(String title,GestureTapCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Text(title,style: TextStyle(fontSize: 16),maxLines: 3,),
            ),
            Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }
  Widget _help(){
    return Code(
      show: false,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text("点击部分组件可以查看源码（比如点我）\n长按组件可复制源码到粘贴板",style: TextStyle(color: Colors.white),),
        ),
      ),
      source: '''
//Code组件使用（以该组件为例）
Code(
  show: false,
  child: Center(
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text("点击任意组件查看源码（比如点我）\\n长按复制源码到粘贴板",style: TextStyle(color: Colors.white),),
    ),
  ),
  source: "这里放源代码",
);
//Code组件定义
//（不用细看，跟着我学完，写这个东西很容易）
class Code extends StatefulWidget {
  Widget child;
  String source;
  bool show;
  Code({this.source = "", @required this.child, this.show = true});
  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  CodeController _codeController;
  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      language: dart,
      theme: monokaiSublimeTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    _codeController.text = widget.source;
    return Column(
      children: [
        InkWell(
          onLongPress: () {
            Clipboard.setData(ClipboardData(text: widget.source));
          },
          onTap: () {
            setState(() {
              widget.show = !widget.show;
            });
          },
          child: Wrap(
            children: [
              widget.child,
              AnimatedCrossFade(
                firstChild: CodeField(
                  enabled: false,
                  controller: _codeController,
                  textStyle: TextStyle(fontFamily: 'SourceCode'),
                ),
                secondChild: Container(),
                duration: Duration(milliseconds: 250),
                crossFadeState: widget.show
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              Divider(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
              ''',
    );
  }
}
