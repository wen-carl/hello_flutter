import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ProgressContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressState();
  }
}

class _ProgressState extends State<ProgressContent>
    with SingleTickerProviderStateMixin {
  var _progressValue = .20;
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 10));
    _animationController.repeat();
    _animationController.addListener(
        () => setState(() => {_progressValue = _animationController.value}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Center(
            child: Column(children: [
          Padding(padding: EdgeInsets.all(8)),
          Text(_progressValue.toStringAsFixed(2)),
          Padding(padding: EdgeInsets.all(8)),
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.all(8)),
          LinearProgressIndicator(),
          Padding(padding: EdgeInsets.all(8)),
          CircularProgressIndicator(
            value: _progressValue,
            strokeWidth: 8.0,
            semanticsLabel: _progressValue.toString(),
            semanticsValue: _progressValue.toString(),
            backgroundColor: Colors.green[100],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          Padding(padding: EdgeInsets.all(8)),
          LinearProgressIndicator(
            value: _progressValue,
          ),
          Padding(padding: EdgeInsets.all(8)),
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(),
          ),
          Padding(padding: EdgeInsets.all(8)),
          SizedBox(
            height: 100,
            child: CircularProgressIndicator(),
          ),
          Padding(padding: EdgeInsets.all(8)),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            semanticsLabel: _progressValue.toString(),
            semanticsValue: _progressValue.toString(),
            valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                .animate(_animationController), // 从灰色变成蓝色
            value: _animationController.value,
          ),
          Padding(padding: EdgeInsets.all(8)),
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            semanticsLabel: _progressValue.toString(),
            semanticsValue: _progressValue.toString(),
            valueColor: ColorTween(begin: Colors.grey, end: Colors.green)
                .animate(_animationController), // 从灰色变成蓝色
            value: _animationController.value,
          ),
        ])));
  }
}
