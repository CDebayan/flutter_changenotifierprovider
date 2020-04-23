import 'package:flutterchangenotifierprovider/example4/model/userdata_model.dart';

class LoginResponse {
  UserDataModel userData;
  int success;
  String message;

  LoginResponse({this.userData, this.success, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserDataModel.fromJson(json['userData'])
        : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}