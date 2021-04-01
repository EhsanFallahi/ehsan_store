import 'package:ehsan_store/screens/admin/add_admin/AddAdminScreen.dart';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDrawer extends StatelessWidget {
  final String userName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: mainBody(context),
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: headerDrawer(),
          ),
          addAdminItem(),
          Divider(
            color: Colors.white60,
            height: 2,
          ),
          exitItem(),
        ],
      ),
    );
  }

  ListTile exitItem() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app_rounded,
        color: PRIMARY_COLOR,
      ),
      onTap: () {
        Get.off(() => LoginScreen());
      },
      title: Text(
        'Exit',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  ListTile addAdminItem() {
    return ListTile(
      leading: Icon(
        Icons.add_box_rounded,
        color: SECONDARY_COLOR,
      ),
      onTap: () {
        Get.to(AddAdminScreen());
      },
      title: Text(
        'Add Admin',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Center headerDrawer() {
    return Center(
      child: Column(
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              letterSpacing: 4,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            userName.toUpperCase(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
