import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example1/counter_screen.dart';
import 'package:flutterchangenotifierprovider/example2/note_list_screen.dart';
import 'package:flutterchangenotifierprovider/example3/todo_list_screen.dart';
import 'package:flutterchangenotifierprovider/example4/login_screen.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            button("Example 1", (){
              Navigator.pushNamed(context, CounterScreen.routeName);
            }),
            button("Example 2", (){
              Navigator.pushNamed(context, NoteListScreen.routeName);
            }),
            button("Example 3", (){
              Navigator.pushNamed(context, ToDoListScreen.routeName);
            }),
            button("Example 4", (){
              Navigator.pushNamed(context, LoginScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
