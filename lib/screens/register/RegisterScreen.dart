import 'dart:html';

import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:ehsan_store/controller/register_controller/RegisterController.dart';
import 'package:ehsan_store/data_source/model/user/User.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/widgets/UserNameTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterationScreen extends StatelessWidget {
  RegisterController get _registerController => Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<RegisterController>(() => RegisterController());

    return Scaffold(body: mainBody(context));
  }

  Container mainBody(BuildContext context) {
    return Container(
      decoration: gradientBackground(),
      child: Form(
        key: _registerController.formKey,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                titleRegister(),
                SizedBox(
                  height: 20,
                ),
                UserNameTextFormField(
                  controller: _registerController.usernameController,
                ),
                passwordTextFieldForm(context),
                confirmPasswordTextFormField(),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: registerButtonItem(),
                ),
              ],
            )),
      ),
    );
  }

  SizedBox registerButtonItem() {
    return SizedBox(width: 140, height: 30, child: registerButton());
  }

  ElevatedButton registerButton() {
    return ElevatedButton(
      child: Text('register'.tr),
      style: buttonStyle(),
      onPressed: () {
        if (_registerController.formKey.currentState.validate()) {
          _registerController.registerUser(
              User(
                  userName: _registerController.usernameController.text
                      .trim()
                      .toLowerCase(),
                  password: _registerController.passwordController.text
                      .trim()
                      .toLowerCase(),
                  roll: 'user'),
              _registerController.confirmPasswordController.text
                  .trim()
                  .toLowerCase());
        } else {
          return;
        }
      },
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

  Container confirmPasswordTextFormField() {
    return Container(
      padding:PADDING_TEXTFORFIELD,
      child: Obx(
        () => confirmPasswordTextForm(),
      ),
    );
  }

  TextFormField confirmPasswordTextForm() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !_registerController.changeDisplayPassword.value,
      controller: _registerController.confirmPasswordController,
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
      decoration: confirmPasswordinputDecoration(),
    );
  }

  InputDecoration confirmPasswordinputDecoration() {
    return InputDecoration(
      enabledBorder: outlineInputBorder(),
      labelText: 'confirm_password'.tr,
    );
  }

  Container passwordTextFieldForm(BuildContext context) {
    return Container(
      padding:PADDING_TEXTFORFIELD,
      child: Obx(
        () => passwordTextForm(context),
      ),
    );
  }

  TextFormField passwordTextForm(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !_registerController.changeDisplayPassword.value,
      controller: _registerController.passwordController,
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
      decoration: inputDecoration(context),
    );
  }

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
        enabledBorder: outlineInputBorder(),
        labelText: 'password'.tr,
        suffixIcon: visibilityIconButton(context));
  }

  IconButton visibilityIconButton(BuildContext context) {
    return IconButton(
        icon: Obx(
          () => visibilityIcon(context),
        ),
        onPressed: () {
          _registerController.changeDisplayPassword.value =
              !_registerController.changeDisplayPassword.value;
        });
  }

  Icon visibilityIcon(BuildContext context) {
    return Icon(
      // Based on passwordVisible state choose the icon
      _registerController.changeDisplayPassword.value
          ? Icons.visibility
          : Icons.visibility_off,
      color: Theme.of(context).accentColor,
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.white70, width: 3),
    );
  }

  Container titleRegister() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          'register'.tr,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              fontSize: 35),
        ));
  }
}
