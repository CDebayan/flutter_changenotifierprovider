import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example2/add_note_screen.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';
import 'package:flutterchangenotifierprovider/example2/update_note_screen.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

import 'note_notifier.dart';

class NoteListScreen extends StatelessWidget {
  static const String routeName = "NoteListScreen";
  static NoteNotifier _noteNotifier;

  @override
  Widget build(BuildContext context) {
    _noteNotifier = Provider.of<NoteNotifier>(context, listen: false);
    return Scaffold(
      floatingActionButton: fab(
          iconData: Icons.add,
          onPressed: () {
            AddNoteScreen(context).addNoteDialog();
          }),
      body: SafeArea(
        child: Consumer<NoteNotifier>(
          builder: (_, value, child) {
            return _setNoteList(value.noteList);
          },
        ),
      ),
    );
  }

  Widget _setNoteList(List<NoteModel> noteList) {
    int size = noteList.length;
    if (size > 0) {
      return ListView.builder(
        itemCount: size,
        itemBuilder: (context, index) {
          NoteModel noteModel = noteList[index];
          return _setNoteItem(context,index,noteModel);
        },
      );
    } else {
      return Center(
        child: Text("No data found"),
      );
    }
  }

  InkWell _setNoteItem(BuildContext context,int index, NoteModel noteModel) {
    return InkWell(
      onTap: () {
        UpdateNoteScreen(context, index).updateNoteDialog();
      },
      child: Card(
        child: ListTile(
          title: Text(noteModel.title),
          subtitle: Text(noteModel.message),
          trailing: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _noteNotifier.deleteNote(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
