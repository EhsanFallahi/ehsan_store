import 'dart:html';

import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginController get _loginController => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(() => LoginController());
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xfF474546), Color(0xfF000000)],
        ),
      ),
      child: Form(
        key: _loginController.formKey,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10,
                          fontSize: 35),
                    )),
                Container(
                    alignment: Alignment.center,
                    width: 140,
                    height: 140,
                    padding: EdgeInsets.all(10),
                    child: Image.asset('images/ehsan.png')),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xfF0496E2)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _loginController.usernameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 6) {
                        return 'Must be more than 6 charater';
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white70, width: 3),
                      ),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Obx(
                    () => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText:
                          !_loginController.changeDisplayPassword.value,
                      controller: _loginController.passwordController,
                      maxLength: 10,
                      style: TextStyle(color: Color(0xfF0496E2)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 6) {
                          return 'Must be more than 6 charater';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white70, width: 3),
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              icon: Obx(
                                () => Icon(
                                  // Based on passwordVisible state choose the icon
                                  _loginController.changeDisplayPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              onPressed: () {
                                _loginController.changeDisplayPassword.value =
                                    !_loginController
                                        .changeDisplayPassword.value;
                              })),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    child: Text('Login'),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {
                      if (_loginController.formKey.currentState.validate()) {
                        _loginController.loginPerson(
                            _loginController.usernameController.text
                                .trim()
                                .toLowerCase()
                                .toString(),
                            _loginController.passwordController.text
                                .trim()
                                .toLowerCase()
                                .toString());
                      } else {
                        return;
                      }
                    },
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: 140,
                      height: 30,
                      child: OutlineButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Register'),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        borderSide:
                            BorderSide(color: Color(0xfF0496E2), width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
