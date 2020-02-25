import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckboxContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckboxState();
  }
}

class CheckboxState extends State<CheckboxContent> {
  var _checkboxStatus = true;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Checkbox(
          value: _checkboxStatus,
          onChanged: (value) {
            setState(() {
              _checkboxStatus = value;
            });
          }),
      Checkbox(
        value: _checkboxStatus,
        activeColor: Colors.green,
        checkColor: Colors.red,
        focusColor: Colors.orange,
        hoverColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            _checkboxStatus = value;
          });
        },
      ),
      CheckboxListTile(
          value: _checkboxStatus,
          title: Text('Title'),
          subtitle: Text('Subtitle'),
          secondary: Icon(Icons.thumb_up),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {
            setState(() {
              _checkboxStatus = value;
            });
          })
    ]));
  }
}
