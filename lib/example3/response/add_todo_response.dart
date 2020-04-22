import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';

class AddToDoResponse {
  ToDoModel todo;
  int success;
  String message;

  AddToDoResponse({this.todo, this.success, this.message});

  AddToDoResponse.fromJson(Map<String, dynamic> json) {
    todo = json['todo'] != null ? new ToDoModel.fromJson(json['todo']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.todo != null) {
      data['todo'] = this.todo.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}