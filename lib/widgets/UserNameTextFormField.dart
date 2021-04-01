import 'package:flutter/material.dart';

class UserNameTextFormField extends StatelessWidget {
  final TextEditingController controller;
  UserNameTextFormField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextFormField(
        style: TextStyle(color: Color(0xfF0496E2)),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
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
          labelText: 'User Name',
        ),
      ),
    );
  }
}