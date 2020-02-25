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
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: _nameController,
                focusNode: _namefocusNode,
                onChanged: (value) {
                  setState(() {
                    _accountText = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: '账号',
                    hintText: '用户名或邮箱',
                    suffixIcon: !_namefocusNode.hasFocus
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
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '********',
                    suffixIcon: !_passwordfocusNode.hasFocus
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
                  //FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              Text(
                'onChange: ' + _accountText,
                textAlign: TextAlign.start,
              ),
              Expanded(
                child: Text(
                  'controller: ' + _accountText2,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          )),
    ));
  }
}
