import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigateToLoginScreen();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xfF474546), Color(0xfF000000)],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image.asset(
                    //   'images/ehsan.png',
                    //   width: 220,
                    //   height: 220,
                    // ),
                    Text(
                      'Ehsan  Store',
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 15,
                          color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Text(
                'Buy Online!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2,
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );

  }
}

void navigateToLoginScreen() async {
  await Future.delayed(Duration(seconds: 3));
  print('23');
  Get.to(LoginScreen());
}
