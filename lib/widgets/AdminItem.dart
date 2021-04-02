import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminItem extends StatelessWidget {
  int id;
  String userName;

  AdminItem({this.id, this.userName});

  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Container mainBody(BuildContext context) {
    return Container(
      width: 300,
      child: listTile(context),
    );
  }

  ListTile listTile(BuildContext context) {
    return ListTile(
      trailing: iconDelete(context),
      title: Obx(
        () => userNameItem(),
      ),
    );
  }

  Text userNameItem() {
    return Text(
      userName.toUpperCase(),
      style: textStyle(),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
    );
  }

  IconButton iconDelete(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.delete_forever_rounded,
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
