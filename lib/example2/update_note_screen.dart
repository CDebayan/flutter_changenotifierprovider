import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';
import 'package:flutterchangenotifierprovider/example2/note_notifier.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';


class UpdateNoteScreen {
  final BuildContext _context;
  final int _position;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  NoteNotifier _noteNotifier;
  UpdateNoteScreen(this._context,this._position);


  updateNoteDialog() {
    return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _noteNotifier = Provider.of<NoteNotifier>(context, listen: false);
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
                _updateNote();
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

  _updateNote() {
    String title = _titleController.text.toString().trim();
    String message = _messageController.text.toString().trim();
    _noteNotifier.updateNote(_position,NoteModel(title: title,message: message));
    Navigator.of(_context).pop();
  }

  _setDataToFields(){
    NoteModel noteModel = _noteNotifier.getNote(_position);
    _titleController.text = noteModel.title;
    _messageController.text = noteModel.message;
  }
}
