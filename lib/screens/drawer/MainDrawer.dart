import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:ehsan_store/screens/favorite/FavoritesScreen.dart';
import 'package:ehsan_store/screens/settings/ProfileSetting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  final String userName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(() => LoginController());

    return Drawer(
      child: mainBody(context),
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          headerDrawer(context),
          dashboardItem(),
          settingItem(),
          favoritesItem(),
          Divider(
            color: Colors.white70,
            height: 1,
          ),
        ],
      ),
    );
  }

  ListTile favoritesItem() {
    return ListTile(
      leading: Icon(
        Icons.star,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(FavoritesScreen());
      },
      title: Text(
        'favorites'.tr,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  ListTile settingItem() {
    return ListTile(
      leading: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(ProfileSetting());
      },
      title: Text(
        'setting'.tr,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  ListTile dashboardItem() {
    return ListTile(
      leading: Icon(
        Icons.home_rounded,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(DashboardScreen());
      },
      title: Text(
        'dashboard'.tr,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Container headerDrawer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.all(20),
      color: Theme.of(context).accentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'hi'.tr,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Text(
              userName.toString().toUpperCase(),
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white60,
                  letterSpacing: 4,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
