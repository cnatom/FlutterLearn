import 'package:demo/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void toContainerPage(BuildContext context){
  Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>ContainerPage()));
}

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1 Container组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //高宽色彩子组件
            Code(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Text("高宽色彩子组件"),
                ),
                source: '''
Container(
  height: 100,
  width: 100,
  color: Colors.red,
  child: Text("高宽色彩子组件"),
),
            '''),
            //没有高宽的时候，自动容纳子组件
            Code(
              child: Container(
                color: Colors.blue,
                child: Text("没有高宽的时候，自动容纳子组件"),
              ),
              source: '''
Container(
  color: Colors.blue,
  child: Text("没有高宽的时候，自动容纳子组件"),
)
              ''',
            ),
            //color与decoration冲突
            Code(
              child: Container(
                //有decoration就不能有这个color，不然会报错
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text("color与decoration冲突"),
              ),
              source: '''
Container(
  //有decoration就不能有这个color，不然会报错
  // color: Colors.red,
  decoration: BoxDecoration(
    color: Colors.green,
  ),
  child: Text("color与decoration冲突"),
)
            ''',
            ),
            Code(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.black, width: 10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("边框与圆角")),
              source: '''
Container(
  decoration: BoxDecoration(
    color: Colors.green,
    border: Border.all(color: Colors.black, width: 10),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text("边框与圆角")
)
              ''',
            ),
            Code(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.pink,
                child: Text("外边距与内边距"),
              ),
              source: '''
Container(
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(10),
  color: Colors.pink,
  child: Text("外边距与内边距"),
)
              ''',
            ),
            Code(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.pink,
                child: Text("居中对齐"),
              ),
              source: '''
Container(
  width: double.infinity,
  alignment: Alignment.center,
  color: Colors.pink,
  child: Text("居中对齐"),
)
              ''',
            )
          ],
        ),
      ),
    );
  }
}
