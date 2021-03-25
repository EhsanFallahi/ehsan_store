import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget childWidget;

  BorderedContainer({this.childWidget, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12, top: 8),
        child: childWidget,
      ),
    );
  }
}
