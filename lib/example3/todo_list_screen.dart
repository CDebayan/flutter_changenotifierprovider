import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example3/add_todo_screen.dart';
import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';
import 'package:flutterchangenotifierprovider/example3/notifier/todo_notifier.dart';
import 'package:flutterchangenotifierprovider/example3/response/todo_list_response.dart';
import 'package:flutterchangenotifierprovider/example3/update_todo_screen.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

class ToDoListScreen extends StatelessWidget {
  static const String routeName = "ToDoListScreen";
  static ToDoNotifier _toDoNotifier;

  @override
  Widget build(BuildContext context) {
    _toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);

    _toDoNotifier.getToDoList(context);
    return Scaffold(
      floatingActionButton: fab(
          iconData: Icons.add,
          onPressed: () {
            AddToDoScreen(context).addToDoDialog();
          }),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Consumer<ToDoNotifier>(
              builder: (_, value, child) {
                return _setNoteList(value.toDoListResponse);
              },
            ),
            Consumer<ToDoNotifier>(
              builder: (_, value, child) {
                return showLoader(value.isLoading);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _setNoteList(ToDoListResponse response) {
    if (response == null) {
      return Container();
    } else {
      int size = response.todoList.length;
      if (size > 0) {
        return ListView.builder(
          itemCount: size,
          itemBuilder: (context, index) {
            ToDoModel noteModel = response.todoList[index];
            return _setNoteItem(context, index, noteModel);
          },
        );
      } else {
        return Center(
          child: Text("No data found"),
        );
      }
    }
  }

  InkWell _setNoteItem(BuildContext context, int index, ToDoModel noteModel) {
    return InkWell(
      onTap: () {
        UpdateToDoScreen(context, index).updateToDoDialog();
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
                  _toDoNotifier.deleteTodo(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showLoader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container();
    }
  }
}
