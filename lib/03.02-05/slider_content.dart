import 'package:flutter/material.dart';

class SliderContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliderState();
  }
}

class _SliderState extends State<SliderContent> {
  var _sliderValue = .10;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Padding(padding: EdgeInsets.all(24)),
      Slider(
        value: _sliderValue,
        label: _sliderValue.toString(),
        min: 0,
        max: 100,
        divisions: 10,
        activeColor: Colors.cyan,
        inactiveColor: Colors.deepOrange,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        },
      ),
      Slider.adaptive(
        value: _sliderValue,
        label: _sliderValue.toString(),
        min: 0,
        max: 100,
        divisions: 10,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        },
      )
    ]));
  }
}
