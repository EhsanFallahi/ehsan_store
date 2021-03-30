import 'dart:html';

import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:ehsan_store/controller/register_controller/RegisterController.dart';
import 'package:ehsan_store/data_source/model/user/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterationScreen extends StatelessWidget {
  RegisterController get _registerController => Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<RegisterController>(() => RegisterController());

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
        key: _registerController.formKey,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10,
                          fontSize: 35),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(color: Color(0xfF0496E2)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _registerController.usernameController,
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
                          !_registerController.changeDisplayPassword.value,
                      controller: _registerController.passwordController,
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
                                  _registerController
                                          .changeDisplayPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              onPressed: () {
                                _registerController
                                        .changeDisplayPassword.value =
                                    !_registerController
                                        .changeDisplayPassword.value;
                              })),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Obx(
                    () => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText:
                          !_registerController.changeDisplayPassword.value,
                      controller: _registerController.confirmPasswordController,
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
                        labelText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                      width: 140,
                      height: 30,
                      child: ElevatedButton(
                        child: Text('Register'),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xfF0496E2)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          if (_registerController.formKey.currentState
                              .validate()) {
                            _registerController.registerUser(
                                User(
                                    userName: _registerController
                                        .usernameController.text
                                        .trim()
                                        .toLowerCase(),
                                    password: _registerController
                                        .passwordController.text
                                        .trim()
                                        .toLowerCase(),
                                    roll: 'user'),
                                _registerController
                                    .confirmPasswordController.text
                                    .trim()
                                    .toLowerCase());
                          } else {
                            return;
                          }
                        },
                      )),
                ),
              ],
            )),
      ),
    ));
  }

// bool validateUserName() {
//   if (nameController.text.toLowerCase().trim() == userName) {
//     return true;
//   } else {
//     return false;
//   }
// }
//
// bool validatePassword() {
//   if (passwordController.text.toLowerCase().trim() == password) {
//     return true;
//   } else {
//     return false;
//   }
// }
}
