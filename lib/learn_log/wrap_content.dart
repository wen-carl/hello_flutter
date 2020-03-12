import 'package:flutter/material.dart';

class WrapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlueAccent,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    spacing: 4,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 8,
                    // ?
                    crossAxisAlignment: WrapCrossAlignment.start,
                    textDirection: TextDirection.ltr,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('0')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('1')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('2')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('3')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('4')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('5')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('6')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('7')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('8')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('9')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('10')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('11')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('12')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('13')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('14')),
                      ),
                      SizedBox(
                        height: 64,
                        width: 100,
                        child:
                            Container(color: Colors.yellow, child: Text('15')),
                      ),
                    ],
                  )))
        ]));
  }
}
