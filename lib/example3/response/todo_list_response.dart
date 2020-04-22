import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';

class ToDoListResponse {
  List<ToDoModel> todoList;
  int success;
  String message;

  ToDoListResponse({this.todoList, this.success, this.message});

  ToDoListResponse.fromJson(Map<String, dynamic> json) {
    if (json['todoList'] != null) {
      todoList = new List<ToDoModel>();
      json['todoList'].forEach((v) {
        todoList.add(new ToDoModel.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todoList != null) {
      data['todoList'] = this.todoList.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}