import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String picture;
  const CircularAvatar({this.picture,Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        picture,height: 45,width: 45,fit: BoxFit.cover,
      ),
    );
  }
}
