import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class FlyTitle extends StatelessWidget {
  final String title;
  FlyTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Code(
      show: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Container(),
          Container(
            height: 2,
            width: 20,
            color: Colors.blue,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 2,
            width: 20,
            color: Colors.blue,
          ),
          Container(),
          Container(),
        ],
      ),
      source: '''
//组件使用
FlyText("$title"),
//组件定义
class FlyTitle extends StatelessWidget {
  final String title;
  FlyTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Code(
      show: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Container(),
          Container(
            height: 2,
            width: 20,
            color: Colors.blue,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 2,
            width: 20,
            color: Colors.blue,
          ),
          Container(),
          Container(),
        ],
      ),
      source: 略,
    );
  }
}
      ''',
    );
  }
}

class Code extends StatefulWidget {
  Widget child;
  String source;
  final bool enable;
  bool show;
  Code({this.source = "", @required this.child, this.show = true,this.enable = true});
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
            if(widget.enable){
              setState(() {
                widget.show = !widget.show;
              });
            }
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
