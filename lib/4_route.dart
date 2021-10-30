import 'package:demo/0_welcome.dart';
import 'package:demo/2_text.dart';
import 'package:demo/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void toRoutePage(BuildContext context) {
  Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => RoutePage1()));
}

class RoutePage1 extends StatefulWidget {
  @override
  _RoutePage1State createState() => _RoutePage1State();
}

class _RoutePage1State extends State<RoutePage1> {
  //其他的不用看，只看这个函数就行
  void toNextPage(){
    //push，顾名思义，是从这个页面跳转到下一个页面
    Navigator.of(context).push(
        //这里面定义页面跳转的样式
        //CupertinoPageRoute是iOS系统中默认的跳转的样式
        CupertinoPageRoute(builder: (context)=>RoutePage2())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4 页面的跳转（第1页）"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Code(
              enable: false,
              child: Center(
                child: _button("Navigator.of(context).push()\n点我跳转到下一页",
                    onTap: (){
                      //点击后跳转到下一页
                      toNextPage();
                }),
              ),
              source: '''
class RoutePage1 extends StatefulWidget {
  @override
  _RoutePage1State createState() => _RoutePage1State();
}

class _RoutePage1State extends State<RoutePage1> {
  //其他的不用看，只看这个函数就行
  void toNextPage(){
    //push，顾名思义，是从这个页面跳转到下一个页面
    Navigator.of(context).push(
        //这里面定义页面跳转的样式
        //CupertinoPageRoute是iOS系统中默认的跳转的样式
        CupertinoPageRoute(builder: (context)=>TextPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4 页面的跳转（第1页）"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Code(
              child: Center(
                child: _button("Navigator.of(context).push()\\n点我跳转到下一页",
                    onTap: (){
                      //点击后跳转到下一页
                      toNextPage();
                }),
              ),
              source: 略,
            )
          ],
        ),
      ),
    );
  }
  //定义一个普通的按钮
  Widget _button(String title,{GestureTapCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
              ''',
            )
          ],
        ),
      ),
    );
  }
  Widget _button(String title,{GestureTapCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
class RoutePage2 extends StatefulWidget {
  @override
  _RoutePage2State createState() => _RoutePage2State();
}

class _RoutePage2State extends State<RoutePage2> {
  //定义一个函数，用来返回到之前页面
  void back(){
    //比较简单粗暴
    Navigator.of(context).pop();
    //返回的同时还可以传输值给上一个页面
    //具体操作培训时再说
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4 页面的跳转（第2页）"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Code(
              enable: false,
              child: Center(
                child: _button("Navigator.of(context).pop()\n返回上一页",
                    onTap: (){
                      //点击按钮返回上一个页面
                      back();
                    }),
              ),
              source: '''
class RoutePage2 extends StatefulWidget {
  @override
  _RoutePage2State createState() => _RoutePage2State();
}

class _RoutePage2State extends State<RoutePage2> {
  //定义一个函数，用来返回到之前页面
  void back(){
    //比较简单粗暴
    Navigator.of(context).pop();
    //返回的同时还可以传输值给上一个页面
    //具体操作培训时再说
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4 页面的跳转（第2页）"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Code(
              child: Center(
                child: _button("Navigator.of(context).pop()\\n返回上一页",
                    onTap: (){
                      //点击按钮返回上一个页面
                      back();
                    }),
              ),
              source: 略,
            ),
          ],
        ),
      ),
    );
  }
  //一个普通的按钮
  Widget _button(String title,{GestureTapCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
             ''',
            ),
          ],
        ),
      ),
    );
  }
  Widget _button(String title,{GestureTapCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

