import 'package:demo/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void toRowColumnPage(BuildContext context) {
  Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => RowColumnPage()));
}

class RowColumnPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<RowColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3 常用布局"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlyTitle("定义几个方便演示的组件"),
            Code(
              child: Center(child: _block(text: "先写一个自定义色块，方便演示"),),
              show: false,
              source: '''
//函数定义（看看就行，重点在下面的布局部分）
Widget _block({Color color = Colors.blue, String text = ""}) {
  return Container(
    height: 80,
    width: 80,
    color: color,
    child: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
  );
}
//函数使用
_block(text: "先写一个自定义色块，方便演示")
              ''',
            ),
            Code(
              show: false,
              child: _border(
                "在这个框框里面演示布局效果",
                  child: Center(
                child: Text("Flutter真简单",style: TextStyle(fontSize: 20),),
              )),
              source: '''
//函数使用
_border(
  "Flutter真简单",
    child: Center(
  child: Text("_border(child:Container())",style: TextStyle(fontSize: 20),),
))
//函数定义（看看就行，有些东西后面会讲）
Widget _border(String text,{Widget child}){
  return Column(
    children: [
      Text(text??"",style: TextStyle(fontSize: 16),),
      Container(
        margin: EdgeInsets.all(10),
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green)
        ),
        child: child,
      ),
    ],
  );
}

              ''',
            ),
            FlyTitle("Column布局"),

            Code(
              child: _border(
                "基本的垂直布局",
                child: Column(
                  children: [
                    _block(),
                    _block(color: Colors.red)
                  ],
                )
              ),
              source: '''
Column(
  children: [
    _block(),
    _block(color: Colors.red)
  ],
)
              ''',
            ),
            Code(
              child: _border(
                "mainAxisAlignment:主轴布局属性\ncrossAxisAlignment:副轴布局属性\n\nColumn时，垂直方向为主轴。\nRow时，水平方向为主轴\n\nMainAxisAlignment.spaceAround\n可以让元素在垂直方向均匀分布",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _block(),
                      _block(color: Colors.red)
                    ],
                  )
              ),
              source: '''
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    _block(),
    _block(color: Colors.red)
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "MainAxisAlignment.spaceBetween\n可以让元素在垂直方向边缘分布\n（还有一些,就不过多演示了）",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _block(),
                      _block(color: Colors.red)
                    ],
                  )
              ),
              source: '''
Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    _block(),
    _block(color: Colors.red)
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "crossAxisAlignment属性：副轴布局\nCrossAxisAlignment.end：放在副轴方向的末尾",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _block(),
                      _block(color: Colors.red)
                    ],
                  )
              ),
              source: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    _block(),
    _block(color: Colors.red)
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "主轴与副轴属性可以结合使用",
                  child: Column(
                    //副轴末尾
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //主轴方向均匀分布
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _block(),
                      _block(color: Colors.red)
                    ],
                  )
              ),
              source: '''
Column(
  //副轴末尾
  crossAxisAlignment: CrossAxisAlignment.end,
  //主轴方向均匀分布
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    _block(),
    _block(color: Colors.red)
  ],
)
              ''',
            ),
            FlyTitle("Row布局"),

            Code(
              child: _border(
                  "Row和Column一样\n也有主轴和副轴属性，非常简单\n只不过主副轴方向和Column是垂直的",
                  child: Row(
                    //副轴方向居中
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //主轴方向均匀分布
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _block(),
                      _block(color: Colors.red)
                    ],
                  )
              ),
              source: '''
Column(
  //副轴末尾
  crossAxisAlignment: CrossAxisAlignment.end,
  //主轴方向均匀分布
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    _block(),
    _block(color: Colors.red)
  ],
)
              ''',
            ),
            FlyTitle("Expanded组件"),
            Code(
              child: _border(
                  "Expanded：使子组件占满主轴的剩余空间",
                  child: Row(
                    //副轴方向居中
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _block(),
                      //占满水平方向的剩余内容
                      Expanded(
                        child: _block(text: "我占满了剩余的水平空间！",color: Colors.red),
                      )
                    ],
                  )
              ),
              source: '''
Row(
  //副轴方向居中
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    _block(),
    //占满水平方向的剩余内容
    Expanded(
      child: _block(text: "我占满了剩余的水平空间！",color: Colors.red),
    )
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "还可以使用flex属性来调整占领区域的比例",
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        //flex默认为1，不写就是取默认值
                        child: _block(text: "我占了1/6！",color: Colors.deepPurpleAccent),
                      ),
                      Expanded(
                        flex: 2,
                        child: _block(text: "我占了2/6！"),
                      ),
                      //占满水平方向的剩余内容
                      Expanded(
                        flex: 3,
                        child: _block(text: "我占了3/6！",color: Colors.red),
                      )
                    ],
                  )
              ),
              source: '''
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      //flex默认为1，不写就是取默认值
      child: _block(text: "我占了1/6！",color: Colors.deepPurpleAccent),
    ),
    Expanded(
      flex: 2,
      child: _block(text: "我占了2/6！"),
    ),
    Expanded(
      flex: 3,
      child: _block(text: "我占了3/6！",color: Colors.red),
    )
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "Column中也可以使用Expanded\n只需要将上面样例的Row改成Column",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        //flex默认为1，不写就是取默认值
                        child: _block(text: "我占了1/6！",color: Colors.deepPurpleAccent),
                      ),
                      Expanded(
                        flex: 2,
                        child: _block(text: "我占了2/6！"),
                      ),
                      //占满水平方向的剩余内容
                      Expanded(
                        flex: 3,
                        child: _block(text: "我占了3/6！",color: Colors.red),
                      )
                    ],
                  )
              ),
              source: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      //flex默认为1，不写就是取默认值
      child: _block(text: "我占了1/6！",color: Colors.deepPurpleAccent),
    ),
    Expanded(
      flex: 2,
      child: _block(text: "我占了2/6！"),
    ),
    //占满水平方向的剩余内容
    Expanded(
      flex: 3,
      child: _block(text: "我占了3/6！",color: Colors.red),
    )
  ],
)
              ''',
            ),
            FlyTitle("Stack布局"),
            Code(
              child: _border(
                  "Stack用于组件之间的相互层叠\n（注意下面样例的层叠顺序和代码顺序的关系）\n（矿小助课表页的主要布局形式）",
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.red,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.green,
                      )
                    ],
                  )
              ),
              source: '''
Stack(
  children: [
    Container(
      height: 200,
      width: 200,
      color: Colors.red,
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    ),
    Container(
      height: 50,
      width: 50,
      color: Colors.green,
    )
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "使用Positioned的\ntop,bottom,right,left属性可以实现精准定位",
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,//距离顶端0
                        right: 10,//距离右边10
                        child: _block(text: "我在右上角"),
                      ),
                      Positioned(
                        bottom: 20,//距离底端20
                        right: 30,//距离右边10
                        child: _block(text: "我在右下角"),
                      ),
                      Positioned(
                        bottom: 0,//距离底端0
                        right: 0,//距离右边0
                        child: _block(text: "我在右下角\n覆盖住了你",color: Colors.red),
                      ),
                    ],
                  )
              ),
              source: '''
Stack(
  children: [
    Positioned(
      top: 0,//距离顶端0
      right: 10,//距离右边10
      child: _block(text: "我在右上角"),
    ),
    Positioned(
      bottom: 20,//距离底端20
      right: 30,//距离右边10
      child: _block(text: "我在右下角"),
    ),
    Positioned(
      bottom: 0,//距离底端0
      right: 0,//距离右边0
      child: _block(text: "我在右下角\\n覆盖住了你",color: Colors.red),
    ),
  ],
)
              ''',
            ),
            Code(
              child: _border(
                  "Position的right为0的时候，是距离右边0。\nQ：但是，是距离哪个组件的右边为0呢？\nA：Stack的外层组件",
                  child: Center(
                    //在Stack的外层套一层边长200的Container
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.black38,
                      child: Stack(
                        children: [
                          //结果显而易见
                          Positioned(
                            top: 0,//距离顶端0
                            right: 10,//距离右边10
                            child: _block(text: "我在右上角"),
                          ),
                          Positioned(
                            bottom: 20,//距离底端20
                            right: 30,//距离右边10
                            child: _block(text: "我在右下角"),
                          ),
                          Positioned(
                            bottom: 0,//距离底端0
                            right: 0,//距离右边0
                            child: _block(text: "我在右下角\n覆盖住了你",color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              source: '''
Center(
  //在Stack的外层套一层边长200的Container
  child: Container(
    height: 200,
    width: 200,
    color: Colors.black38,
    child: Stack(
      children: [
        //结果显而易见，以灰色的Container为边缘
        Positioned(
          top: 0,//距离顶端0
          right: 10,//距离右边10
          child: _block(text: "我在右上角"),
        ),
        Positioned(
          bottom: 20,//距离底端20
          right: 30,//距离右边10
          child: _block(text: "我在右下角"),
        ),
        Positioned(
          bottom: 0,//距离底端0
          right: 0,//距离右边0
          child: _block(text: "我在右下角\\n覆盖住了你",color: Colors.red),
        ),
      ],
    ),
  ),
)
              ''',
            )
          ],
        ),
      ),
    );
  }
  Widget _border(String text,{Widget child}){
    return Column(
      children: [
        Text(text??"",style: TextStyle(fontSize: 16),),
        Container(
          margin: EdgeInsets.all(10),
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green)
          ),
          child: child,
        ),
      ],
    );
  }
  Widget _block({Color color = Colors.blue, String text = ""}) {
    return Container(
      height: 80,
      width: 80,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
