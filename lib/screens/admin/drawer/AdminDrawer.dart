import 'package:ehsan_store/screens/admin/add_admin/AddAdminScreen.dart';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

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
      child: columnListItemViews(context),
    );
  }

  Column columnListItemViews(BuildContext context) {
    return Column(
      children: [
        headerItem(context),
        addAdminItem(),
        divider(),
        exitItem(),
      ],
    );
  }

  Divider divider() {
    return Divider(
      color: Colors.white60,
      height: 2,
    );
  }

  Container headerItem(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Theme.of(context).accentColor,
      child: headerDrawer(),
    );
  }

  ListTile exitItem() {
    return exitListTile();
  }

  ListTile exitListTile() {
    return ListTile(
      leading: iconExit(),
      onTap: () {
        Get.to(SplashScreen());
      },
      title: titleExit(),
    );
  }

  Text titleExit() {
    return Text(
      'Exit',
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  Icon iconExit() {
    return Icon(
      Icons.exit_to_app_rounded,
      color: SECONDARY_COLOR,
    );
  }

  ListTile addAdminItem() {
    return AddListTile();
  }

  ListTile AddListTile() {
    return ListTile(
      leading: iconAdd(),
      onTap: () {
        Get.to(AddAdminScreen());
      },
      title: titleAddAdmin(),
    );
  }

  Text titleAddAdmin() {
    return Text(
      'Add Admin',
      style: TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  Icon iconAdd() {
    return Icon(
      Icons.add_box_rounded,
      color: SECONDARY_COLOR,
    );
  }

  Center headerDrawer() {
    return Center(
      child: columnListItem(),
    );
  }

  Column columnListItem() {
    return Column(
      children: [
        titleWelcome(),
        SizedBox(
          height: 8,
        ),
        titleUserName(),
      ],
    );
  }

  Text titleUserName() {
    return Text(
      userName.toUpperCase(),
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
          letterSpacing: 2),
    );
  }

  Text titleWelcome() {
    return Text(
      'Welcome',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontStyle: FontStyle.italic,
        letterSpacing: 4,
      ),
    );
  }
}
