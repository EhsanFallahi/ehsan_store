import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  LoginController get _loginController => Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(() => LoginController());
    var userName=Get.arguments;
    return Drawer(
      child: Container(

        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.2,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hi',
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Text(
                      userName.toString().toUpperCase(),
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white60,
                        letterSpacing: 4,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded,color: Colors.black,),
              onTap: (){},
              title: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.black,),
              onTap: (){},
              title: Text(
                'Setting',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.tag,color: Colors.black,),
              onTap: (){},
              title: Text(
                'Favorites',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
            Divider(
              color: Colors.white70,
              height: 1,
            ),
            ListTile(
              leading: Icon(Icons.app_blocking_outlined,color: Colors.black,),
              onTap: (){},
              title: Text(
                'About Us',
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
