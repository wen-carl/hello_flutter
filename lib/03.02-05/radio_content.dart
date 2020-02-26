import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RadioContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RadioState();
  }
}

class RadioState extends State<RadioContent> {
  var _radioStatus = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Radio(
          groupValue: _radioStatus,
          value: 0,
          onChanged: (value) {
            setState(() {
              _radioStatus = value;
            });
          }),
      Radio(
        groupValue: _radioStatus,
        value: 1,
        activeColor: Colors.green,
        focusColor: Colors.orange,
        hoverColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _radioStatus = value;
          });
        },
      ),
      Radio(
        groupValue: _radioStatus,
        value: 2,
        activeColor: Colors.green,
        focusColor: Colors.orange,
        hoverColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _radioStatus = value;
          });
        },
      ),
      Radio(
        groupValue: _radioStatus,
        value: 2,
        activeColor: Colors.green,
        focusColor: Colors.orange,
        hoverColor: Colors.blue,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onChanged: (value) {
          setState(() {
            _radioStatus = value;
          });
        },
      ),
      RadioListTile(
          value: 3,
          groupValue: _radioStatus,
          title: Text('Hello Flutter!'),
          subtitle: Text('Subtitle'),
          secondary: Icon(Icons.thumb_up),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {
            setState(() {
              _radioStatus = value;
            });
          })
    ]));
  }
}
