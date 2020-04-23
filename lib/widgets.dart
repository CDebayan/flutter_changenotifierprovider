import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

RaisedButton button(String title, Function() onPressed) {
  return RaisedButton(
    child: Text(title),
    onPressed: onPressed,
  );
}

FloatingActionButton fab(
    {String heroTag = "",
    @required IconData iconData,
    @required Function() onPressed}) {
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

showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

materialInputTextField(String hint, TextEditingController controller,
    String errorText, bool enabled, ValueChanged<String> opnChange) {
  return TextField(
    controller: controller,
    onChanged: opnChange,
    decoration: new InputDecoration(
      errorText: errorText,
      labelText: hint,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: new BorderSide(),
      ),
    ),
  );
}

emailTextField(
  String hint,
  TextEditingController controller,
  String errorText,
  bool enabled,
) {
  return TextField(
    controller: controller,
    decoration: new InputDecoration(
      errorText: errorText,
      labelText: hint,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: new BorderSide(),
      ),
    ),
  );
}

materialButton(String title, bool isLoading, Function() onPressed) {
  return Container(
    height: 50,
    child: MaterialButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Align(
        child: isLoading
            ? Container(
          height: 35,
              width: 35,
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                ),
            )
            : Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
      ),
      onPressed: onPressed,
    ),
  );
}
