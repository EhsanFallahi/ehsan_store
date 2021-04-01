import 'package:flutter/material.dart';

class DescriptionTextFormField extends StatelessWidget {
  final TextEditingController controller;
  DescriptionTextFormField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,top: 8),
      child: TextFormField(
        style: TextStyle(color: Color(0xfF0496E2)),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        maxLength: 100,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length < 30) {
            return 'Must be more than 30 charater';
          } else
            return null;
        },
        maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70, width: 3),
          ),
          labelText: 'Description',
        ),
      ),
    );
  }
}