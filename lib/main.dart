import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example1/counter_notifier.dart';
import 'package:flutterchangenotifierprovider/example1/counter_screen.dart';
import 'package:flutterchangenotifierprovider/example2/note_list_screen.dart';
import 'package:flutterchangenotifierprovider/example2/note_notifier.dart';
import 'package:flutterchangenotifierprovider/example3/notifier/todo_notifier.dart';
import 'package:flutterchangenotifierprovider/example3/todo_list_screen.dart';
import 'package:flutterchangenotifierprovider/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterNotifier>(create: (_) => CounterNotifier()),
        ChangeNotifierProvider<NoteNotifier>(create: (_) => NoteNotifier()),
        ChangeNotifierProvider<ToDoNotifier>(create: (_) => ToDoNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName : (context) => HomeScreen(),
          CounterScreen.routeName : (context) => CounterScreen(),
          NoteListScreen.routeName : (context) => NoteListScreen(),
          ToDoListScreen.routeName : (context) => ToDoListScreen(),
        },
      ),
    );
  }
}
