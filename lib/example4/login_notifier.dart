import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example4/response/login_response.dart';
import 'package:flutterchangenotifierprovider/services/dio_services.dart';

class LoginNotifier extends ChangeNotifier {
  bool isLoading = false;
  bool emailEnable = true;
  bool passwordEnable = true;
  String emailError;
  String passwordError;

  Future<LoginResponse> login(String email, String password) async {
    bool validationError = false;

    if (!_isValidEmail(email)) {
      validationError = true;
    }
    if (!_isValidPassword(password)) {
      validationError = true;
    }

    if (validationError) {
      notifyListeners();
      return null;
    }

    setIdLoading(true);
    LoginResponse res = await DioServices.login(email, password);
    setIdLoading(false);
    return res;
  }

  void setIdLoading(bool value) {
    isLoading = value;
    emailEnable = !value;
    passwordEnable = !value;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    if (email.isEmpty) {
      emailError = "Please enter email";
      return false;
    } else if (!EmailValidator.validate(email)) {
      emailError = "Please enter valid email";
      return false;
    } else {
      return true;
    }
  }

  bool _isValidPassword(String password) {
    if (password.isEmpty) {
      passwordError = "Please enter password";
      return false;
    } else if (password.length < 4) {
      passwordError = "Password length should be greater than 3";
      return false;
    } else {
      return true;
    }
  }

  void clearPasswordError() {
    if (passwordError != null) {
      passwordError = null;
      notifyListeners();
    }
  }

  void clearEmailError() {
    if (emailError != null) {
      emailError = null;
      notifyListeners();
    }
  }

  void clearData() {
    isLoading = false;
    emailEnable = true;
    passwordEnable = true;
    emailError = null;
    passwordError = null;
    //notifyListeners();
  }
}
