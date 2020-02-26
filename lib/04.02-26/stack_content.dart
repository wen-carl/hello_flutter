import 'package:flutter/material.dart';

class StackContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Container(
            color: Colors.lightGreenAccent,
            child: Stack(
                alignment: AlignmentDirectional.topStart,
                fit: StackFit.loose,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 48.0,
                    top: 200,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Positioned(
                    bottom: 32.0,
                    right: 32,
                    left: 100,
                    child: Container(
                      height: 100,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Positioned(
                    bottom: 200.0,
                    left: 32,
                    right: 32,
                    height: 100,
                    child: Container(
                      color: Colors.lightBlue,
                    ),
                  )
                ]),
          ),
        ));
  }
}
