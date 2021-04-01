import 'package:flutter/material.dart';

class AmountTextFormField extends StatelessWidget {
  final TextEditingController controller;
  AmountTextFormField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.only(left: 15,right: 15,top: 8),
      child: TextFormField(
        style: TextStyle(color: Color(0xfF0496E2)),
        maxLength: 3,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length < 1) {
            return 'Must be more than 1charater';
          } else
            return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white70, width: 3),
          ),
          labelText: 'Amount',
        ),
      ),
    );
  }
}
