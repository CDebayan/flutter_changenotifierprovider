import 'dart:io';
import 'package:flutterchangenotifierprovider/example3/model/todo_model.dart';
import 'package:flutterchangenotifierprovider/example3/response/add_todo_response.dart';
import 'package:flutterchangenotifierprovider/example3/response/todo_list_response.dart';
import 'package:flutterchangenotifierprovider/example3/response/todo_list_response.dart';
import 'package:flutterchangenotifierprovider/example3/response/todo_list_response.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';


import 'dio_client.dart';


class DioServices{
  static Future<ToDoListResponse> getToDoList() async {
    var response = await DioClient.getCall('getTodoList.php');
    ToDoListResponse toDoListResponse = ToDoListResponse.fromJson(response);
    return toDoListResponse;
  }

  static Future<AddToDoResponse> addToDo(ToDoModel toDoModel) async{
    FormData formData = new FormData.fromMap({
      "title": toDoModel.title,
      "message": toDoModel.message,
    });
    var response = await DioClient.postCall('addTodo.php',formData: formData);
    AddToDoResponse addToDoResponse = AddToDoResponse.fromJson(response);
    return addToDoResponse;
  }

  static Future<AddToDoResponse> updateToDo(ToDoModel toDoModel) async{
    FormData formData = new FormData.fromMap({
      "id": toDoModel.id,
      "title": toDoModel.title,
      "message": toDoModel.message,
    });
    var response = await DioClient.postCall('updateTodo.php',formData: formData);
    AddToDoResponse addToDoResponse = AddToDoResponse.fromJson(response);
    return addToDoResponse;
  }

  static Future<AddToDoResponse> deleteToDo(String id) async{
    FormData formData = new FormData.fromMap({
      "id": id,
    });
    var response = await DioClient.postCall('deleteTodo.php',formData: formData);
    AddToDoResponse addToDoResponse = AddToDoResponse.fromJson(response);
    return addToDoResponse;
  }



}