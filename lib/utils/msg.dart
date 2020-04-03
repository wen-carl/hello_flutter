import 'package:flutter/material.dart';

typedef ErrorCallback = void Function(Object);

showSnackbar(BuildContext context, String msg,
    {ErrorCallback onError = print}) {
  try {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  } catch (e) {
    onError(e);
  }
}
