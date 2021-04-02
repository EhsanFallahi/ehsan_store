import 'dart:html';

import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:ehsan_store/screens/register/RegisterScreen.dart';
import 'package:ehsan_store/widgets/UserNameTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginController get _loginController => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(() => LoginController());
    return Scaffold(body: mainBody(context));
  }

  Container mainBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradientBackground(),
      ),
      child: Form(
        key: _loginController.formKey,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                titleLogin(),
                logoItem(),
                SizedBox(
                  height: 20,
                ),
                UserNameTextFormField(
                  controller: _loginController.usernameController,
                ),
                passwordTextFormField(context),
                SizedBox(
                  height: 30,
                ),
                loginButton(),
                registerButton(),
              ],
            )),
      ),
    );
  }

  Expanded registerButton() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: SizedBox(
          width: 140,
          height: 30,
          child: outlineButton(),
        ),
      ),
    );
  }

  OutlineButton outlineButton() {
    return OutlineButton(
      textColor: Colors.white,
      color: Colors.blue,
      child: Text('register'.tr),
      onPressed: () {
        cleanTextFeilds();
        Get.to(RegisterationScreen());
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide: BorderSide(color: Color(0xfF0496E2), width: 2),
    );
  }

  SizedBox loginButton() {
    return SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        child: Text('login'.tr),
        style: buttonStyle(),
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
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )));
  }

  Container passwordTextFormField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Obx(
        () => TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: !_loginController.changeDisplayPassword.value,
          controller: _loginController.passwordController,
          maxLength: 10,
          style: TextStyle(color: Color(0xfF0496E2)),
          validator: (value) {
            if (value.isEmpty) {
              return 'please_enter_some_text'.tr;
            }
            if (value.length < 6) {
              return 'must_be_more_than_6_character'.tr;
            } else
              return null;
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white70, width: 3),
              ),
              labelText: 'password'.tr,
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
                        !_loginController.changeDisplayPassword.value;
                  })),
        ),
      ),
    );
  }

  Container logoItem() {
    return Container(
        alignment: Alignment.center,
        width: 140,
        height: 140,
        padding: EdgeInsets.all(10),
        child: Image.asset('images/ehsan.png'));
  }

  Container titleLogin() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          'login'.tr,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              fontSize: 35),
        ));
  }

  LinearGradient gradientBackground() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xfF474546), Color(0xfF000000)],
    );
  }

  void cleanTextFeilds() {
    _loginController.usernameController.text = '';
    _loginController.passwordController.text = '';
  }
}
