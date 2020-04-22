import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';
import 'package:flutterchangenotifierprovider/example2/note_notifier.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

class AddNoteScreen {
  final BuildContext _context;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  NoteNotifier _noteNotifier;
  AddNoteScreen(this._context);

  addNoteDialog() {
    return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _noteNotifier = Provider.of<NoteNotifier>(context, listen: false);
        return AlertDialog(
          title: Text('Add Note'),
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
    _noteNotifier.addNote(NoteModel(title: title,message: message));
    Navigator.of(_context).pop();
  }
}
