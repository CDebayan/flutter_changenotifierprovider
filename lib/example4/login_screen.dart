import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example4/login_notifier.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static LoginNotifier _loginNotifier;

  @override
  Widget build(BuildContext context) {
    _loginNotifier = Provider.of<LoginNotifier>(context, listen: false);
    _loginNotifier.clearData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          height: MediaQuery.of(context).size.height,
          child: Consumer<LoginNotifier>(
            builder: (_, value,__) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  materialInputTextField("Enter Email", _emailController,value.emailError,value.emailEnable,(_){
                    value.clearEmailError();
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  materialInputTextField("Enter Password", _passwordController,value.passwordError,value.passwordEnable,(_){
                    value.clearPasswordError();
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  materialButton("Login", value.isLoading, () {
                    _login();
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _login() {
    _loginNotifier.login(_emailController.text, _passwordController.text).then((result){
      if(result != null){
        if(result.success == 1){
          showToast(result.message);
          _loginNotifier.clearData();
        }else if(result.success == 0){
          showToast(result.message);
        }
      }
    });
  }
}
