import 'package:flutter/material.dart';

class HeaderWithoutSearch extends StatelessWidget {
  final String title;

  HeaderWithoutSearch({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      height: 100,
      width: double.infinity,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: 6,
              color: Colors.white70),
        ),
      ),
    );
  }
}
