import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminItem extends StatelessWidget {
  int id;
  String userName;

  AdminItem({this.id,this.userName});
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 300,
      child: ListTile(
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete_forever_rounded,
            color: Theme.of(context).accentColor,
          ),
        ),
        title: Obx(()=>Text(
            userName.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}