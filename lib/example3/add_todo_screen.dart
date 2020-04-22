import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';
import 'package:flutterchangenotifierprovider/example2/note_notifier.dart';
import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';
import 'package:flutterchangenotifierprovider/example3/notifier/todo_notifier.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

class AddToDoScreen {
  final BuildContext _context;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  ToDoNotifier _toDoNotifier;
  AddToDoScreen(this._context);

  addToDoDialog() {
    return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);
        return AlertDialog(
          title: Text('Add ToDo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                inputTextField('Title', _titleController),
                inputTextField('Message', _messageController),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Done'),
              onPressed: () {
                _initAddNote();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _initAddNote() {
    String title = _titleController.text.toString().trim();
    String message = _messageController.text.toString().trim();
    _toDoNotifier.addTodo(ToDoModel(title: title,message: message));
    Navigator.of(_context).pop();
  }
}
