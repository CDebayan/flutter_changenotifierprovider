import 'package:flutter/cupertino.dart';
import 'package:flutterchangenotifierprovider/example2/note_model.dart';
import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';
import 'package:flutterchangenotifierprovider/example3/response/todo_list_response.dart';
import 'package:flutterchangenotifierprovider/services/dio_services.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

class ToDoNotifier extends ChangeNotifier {
  ToDoListResponse toDoListResponse;

  bool isLoading = false;

  void getToDoList(context) async {
    isLoading = true;
    notifyListeners();
    toDoListResponse = await DioServices.getToDoList();
    isLoading = false;
    notifyListeners();
  }

  void addTodo(ToDoModel toDoModel) async{
    isLoading = true;
    notifyListeners();
    var addToDoResponse = await DioServices.addToDo(toDoModel);
    if(addToDoResponse.success == 1){
      ToDoModel todo = addToDoResponse.todo;
      toDoListResponse.todoList.add(todo);
    }
    isLoading = false;
    notifyListeners();
  }

  void updateTodo(int position,ToDoModel toDoModel) async{
    isLoading = true;
    notifyListeners();
    var addToDoResponse = await DioServices.updateToDo(toDoModel);
    if(addToDoResponse.success == 1){
      ToDoModel todo = addToDoResponse.todo;
      toDoListResponse.todoList[position] = todo;
    }
    isLoading = false;
    notifyListeners();
  }

  void deleteTodo(int position) async{
    isLoading = true;
    notifyListeners();
    var addToDoResponse = await DioServices.deleteToDo(toDoListResponse.todoList[position].id);
    if(addToDoResponse.success == 1){
      toDoListResponse.todoList.removeAt(position);
    }
    isLoading = false;
    notifyListeners();
  }

  ToDoModel getTodo(int position) {
    return toDoListResponse.todoList[position];
  }
}
