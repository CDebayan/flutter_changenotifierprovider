import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';


class NoteNotifier extends ChangeNotifier {
  List<NoteModel> noteList = List<NoteModel>();


  void load(){
    noteList.add(NoteModel(title: "tit",message: "mess"));
  }


  void addNote(NoteModel noteModel){
    noteList.add(noteModel);
    notifyListeners();
  }

  NoteModel getNote(int position) {
    return noteList[position];
  }

  void updateNote(int position, NoteModel noteModel) {
    noteList[position] = noteModel;
    notifyListeners();
  }

  void deleteNote(int position) {
    noteList.removeAt(position);
    notifyListeners();
  }
}
