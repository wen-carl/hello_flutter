import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwitchContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchState();
  }
}

class _SwitchState extends State<SwitchContent> {
  var _switchStatus = true;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Switch(
          value: _switchStatus,
          onChanged: (value) {
            setState(() {
              _switchStatus = !_switchStatus;
            });
          }),
      Switch(
        value: _switchStatus,
        activeColor: Colors.green,
        inactiveTrackColor: Colors.deepPurple,
        onChanged: (value) {
          setState(() {
            _switchStatus = !_switchStatus;
          });
        },
      ),
      SwitchListTile(
          value: _switchStatus,
          title: Text('Title'),
          secondary: Icon(Icons.time_to_leave),
          onChanged: (value) {
            setState(() {
              _switchStatus = !_switchStatus;
            });
          }),
      Switch.adaptive(
          value: _switchStatus,
          onChanged: (value) {
            setState(() {
              _switchStatus = !_switchStatus;
            });
          })
    ]));
  }
}
