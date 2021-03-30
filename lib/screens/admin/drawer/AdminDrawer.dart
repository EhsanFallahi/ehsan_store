import 'package:ehsan_store/screens/admin/add_admin/AddAdminScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDrawer extends StatelessWidget {
  final String userName=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        letterSpacing:4,
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
                        letterSpacing: 2
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_box_rounded,color: Colors.black,),
              onTap: (){
                Get.to(AddAdminScreen());
              },
              title: Text(
                'Add Admin',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
