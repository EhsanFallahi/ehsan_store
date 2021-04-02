import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    navigateToLoginScreen();
    return Scaffold(
      body: mainBody(),
    );
  }

  Container mainBody() {
    return Container(
      decoration: gradientBackground(),
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
                  Container(
                      child: Image.asset('images/ehsan.png'),
                    width: 140,
                    height: 140,
                  ),
                  titleEhsanStore(),
                ],
              ),
            ),
            titleBuyOnline()
          ],
        ),
      ),
    );
  }

  Text titleBuyOnline() {
    return Text(
      'buy_online'.tr,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w200,
          letterSpacing: 2,
          color: Colors.grey),
    );
  }

  Text titleEhsanStore() {
    return Text(
      'Ehsan  Store',
      style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w600,
          letterSpacing: 15,
          color: Colors.white70),
    );
  }
}

void navigateToLoginScreen() async {
  await Future.delayed(Duration(seconds: 3));
  Get.to(LoginScreen());
}
