import 'package:flutter/material.dart';

class TextFieldContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldContentState();
  }
}

class _TextFieldContentState extends State<TextFieldContent> {
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _accountText = '';
  var _accountText2 = '';
  var _passwordText = '';

  var _namefocusNode = FocusNode();
  var _passwordfocusNode = FocusNode();
  FocusScopeNode focusScopeNode;
  var _focusState = 0;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _accountText2 = _nameController.text;
      });
    });
    _passwordController.addListener(() {
      _passwordText = _passwordController.text;
    });
    _namefocusNode.addListener(() {
      if (_namefocusNode.hasFocus) {
        setState(() {
          _focusState = 1;
        });
      } else if (!_passwordfocusNode.hasFocus) {
        setState(() {
          _focusState = 0;
        });
      }
    });
    _passwordfocusNode.addListener(() {
      if (_passwordfocusNode.hasFocus) {
        setState(() {
          _focusState = 2;
        });
      } else if (!_namefocusNode.hasFocus) {
        setState(() {
          _focusState = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
          onTap: () {
            if (_namefocusNode.hasFocus) _namefocusNode.unfocus();
            if (_passwordfocusNode.hasFocus) _passwordfocusNode.unfocus();
            //FocusScope.of(context).unfocus();
            // setState(() {
            //   _focusState = 0;
            // });
          },
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _nameController,
                focusNode: _namefocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _accountText = value;
                  });
                },
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordfocusNode);
                },
                decoration: InputDecoration(
                    labelText: '账号',
                    hintText: '用户名或邮箱',
                    suffixIcon: _focusState != 1
                        ? null
                        : IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.red,
                            onPressed: () {
                              _nameController.text = '';
                            },
                          ),
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                focusNode: _passwordfocusNode,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '********',
                    suffixIcon: _focusState != 2
                        ? null
                        : IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.red,
                            onPressed: () {
                              _passwordController.clear();
                            },
                          ),
                    prefixIcon: Icon(Icons.lock)),
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("登录"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              Text(
                'onChange: ' + _accountText,
                textAlign: TextAlign.start,
              ),
              Text(
                'controller: ' + _accountText2,
                textAlign: TextAlign.start,
              ),
              Expanded(
                child: Column(children: [
                  EditableText(
                      controller: _nameController,
                      focusNode: _namefocusNode,
                      style: TextStyle(
                          backgroundColor: Colors.transparent,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                      cursorColor: Colors.red,
                      backgroundCursorColor: Colors.cyan)
                ]),
              ),
            ],
          )),
    ));
  }
}
