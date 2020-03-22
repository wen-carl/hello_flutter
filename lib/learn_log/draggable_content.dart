import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';
import 'dart:ui';

class DraggableContent extends StatefulWidget {
  @override
  _DraggableContentState createState() => _DraggableContentState();
}

class _DraggableContentState extends State<DraggableContent> {
  var _dragData;
  var _size = MediaQueryData.fromWindow(window).size;

  var _statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
  var _navBarHeight = kToolbarHeight;

  Offset _offset = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return
        /*
    Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.topLeft,
      child: Transform.translate(
          offset: _offset,
          child: Draggable(
            child: Icon(
              Icons.face,
              size: 48,
            ),
            feedback: Icon(
              Icons.face,
              size: 48,
              color: Colors.cyan,
            ),
            //
            childWhenDragging: Container(
              width: 0,
              height: 0,
            ),
            onDragEnd: (dragEndDetails) {
              setState(() {
                _offset = dragEndDetails.offset -
                    Offset(0, statusBarHeight + navBarHeight);
              });

              print(" onDragEnd - dragEndDetails.offset: " +
                  dragEndDetails.offset.toString());
              print(" onDragEnd - offset: " + _offset.toString());
            },
          )),
    );
    */
        Container(
      alignment: Alignment.topLeft,
      height: _size.height,
      width: _size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: RandomColor.next(),
            alignment: Alignment.topLeft,
            constraints:
                BoxConstraints.expand(width: double.infinity, height: 200),
            child: StatefulBuilder(builder: (context, setState) {
              return Transform.translate(
                  offset: _offset,
                  child: Draggable(
                    child: Icon(
                      Icons.face,
                      size: 48,
                    ),
                    feedback: Icon(
                      Icons.face,
                      size: 48,
                      color: Colors.cyan,
                    ),
                    //
                    childWhenDragging: Container(
                      width: 0,
                      height: 0,
                    ),
                    onDragEnd: (dragEndDetails) {
                      //this.setState
                      setState(() {
                        _offset = dragEndDetails.offset -
                            Offset(0, _statusBarHeight + _navBarHeight);
                      });

                      print(" onDragEnd - dragEndDetails.offset: " +
                          dragEndDetails.offset.toString());
                      print(" onDragEnd - offset: " + _offset.toString());
                    },
                  ));
            }),
          ),
          Expanded(
            flex: 1,
            child: RandomContainer(
              child: Row(
                children: <Widget>[
                  Draggable(
                    child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '孟',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    feedback: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '孟',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    childWhenDragging: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '孟',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RandomContainer(
              child: Row(
                children: <Widget>[
                  // onDragStarted：开始拖动时回调。
                  // onDragEnd：拖动结束时回调。
                  // onDraggableCanceled：未拖动到DragTarget控件上时回调。
                  // onDragCompleted：拖动到DragTarget控件上时回调。
                  Draggable(
                    data: Color(0x000000FF),
                    onDragStarted: () {
                      print('onDragStarted');
                    },
                    onDragEnd: (DraggableDetails details) {
                      print('onDragEnd:$details');
                    },
                    onDraggableCanceled: (Velocity velocity, Offset offset) {
                      print(
                          'onDraggableCanceled velocity:$velocity,offset:$offset');
                    },
                    onDragCompleted: () {
                      print('onDragCompleted');
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '孟',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    feedback: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        child: Text(
                          '孟',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),

                  // DragTarget
                  // 当onWillAccept返回true时， candidateData参数的数据是Draggable的data数据。
                  // 当onWillAccept返回false时， rejectedData参数的数据是Draggable的data数据
                  //
                  // onWillAccept：拖到该控件上时调用，需要返回true或者false，返回true，松手后会回调onAccept，否则回调onLeave。
                  // onAccept：onWillAccept返回true时，用户松手后调用。
                  // onLeave：onWillAccept返回false时，用户松手后调用
                  DragTarget<Color>(
                    builder: (BuildContext context, List<Color> candidateData,
                        List<dynamic> rejectedData) {
                      print(
                          'candidateData:$candidateData,rejectedData:$rejectedData');
                      return _dragData == null
                          ? Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.red)),
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                '孟',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            );
                    },
                    onWillAccept: (Color color) {
                      print('onWillAccept:$color');
                      return true;
                    },
                    onAccept: (Color color) {
                      setState(() {
                        _dragData = color;
                      });
                      print('onAccept:$color');
                    },
                    onLeave: (Color color) {
                      print('onLeave:$color');
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
