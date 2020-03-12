import 'package:flutter/material.dart';

class AlignContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  color: Colors.orange,
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Container(
                        color: Colors.lightBlueAccent, width: 64, height: 64),
                  ),
                )),
            SizedBox(
                child: Container(
              color: Colors.tealAccent,
              child: Align(
                alignment: Alignment.topCenter,
                widthFactor: 1.5,
                heightFactor: 1.8,
                child: Container(
                    color: Colors.lightBlueAccent, width: 64, height: 64),
              ),
            )),
            SizedBox(
                width: 200,
                height: 200,
                child: Container(
                  color: Colors.yellow,
                  child: Center(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Container(
                        color: Colors.lightBlueAccent, width: 64, height: 64),
                  ),
                )),
          ]),
        ));
  }
}
