import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

RaisedButton button(String title,Function() onPressed){
  return RaisedButton(
    child: Text(title),
    onPressed: onPressed,
  );
}

FloatingActionButton fab({String heroTag = "",@required IconData iconData,@required Function() onPressed}){
  return FloatingActionButton(
    heroTag: heroTag,
    child: Icon(iconData),
    onPressed: onPressed,
  );
}

inputTextField(hint, controller) {
  return TextField(
    decoration: InputDecoration(hintText: hint),
    controller: controller,
  );
}

showToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
  );
}