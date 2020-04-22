import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';
import 'package:flutterchangenotifierprovider/example2/note_notifier.dart';
import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';
import 'package:flutterchangenotifierprovider/example3/notifier/todo_notifier.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';


class UpdateToDoScreen {
  final BuildContext _context;
  final int _position;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  ToDoNotifier _toDoNotifier;
  String id;
  UpdateToDoScreen(this._context,this._position);


  updateToDoDialog() {
    return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);
        _setDataToFields();
        return AlertDialog(
          title: Text('Update Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                inputTextField('Note', _titleController),
                inputTextField('Date', _messageController),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Done'),
              onPressed: () {
                _updateToDo();
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

  _updateToDo() {
    String title = _titleController.text.toString().trim();
    String message = _messageController.text.toString().trim();
    _toDoNotifier.updateTodo(_position,ToDoModel(id: id,title: title,message: message));
    Navigator.of(_context).pop();
  }

  _setDataToFields(){
    ToDoModel toDoModel = _toDoNotifier.getTodo(_position);
    id = toDoModel.id;
    _titleController.text = toDoModel.title;
    _messageController.text = toDoModel.message;
  }
}
