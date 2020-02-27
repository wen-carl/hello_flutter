import 'package:flutter/material.dart';

class PaddingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
          color: Colors.lightBlue,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 32, 64),
              child: Container(
                color: Colors.lightGreenAccent,
                height: 48,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 48, right: 32),
              child: Container(
                color: Colors.lightGreenAccent,
                height: 48,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Container(
                color: Colors.lightGreenAccent,
                height: 48,
              ),
            ),
          ])),
    );
  }
}
