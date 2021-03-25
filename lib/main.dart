import 'package:ehsan_store/screens/admin/add_admin/AddAdmin.dart';
import 'package:ehsan_store/screens/admin/add_product/AddProduct.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetail.dart';
import 'package:ehsan_store/screens/admin/product_edit/ProductEdit.dart';
import 'package:ehsan_store/screens/cart/CartScreen.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:ehsan_store/screens/favorite/FavoritesScreen.dart';
import 'package:ehsan_store/screens/login/LoginScreen.dart';
import 'package:ehsan_store/screens/product_detail/ProductDetail.dart';
import 'package:ehsan_store/screens/register/Registeration.dart';
import 'package:ehsan_store/screens/settings/ProfileSetting.dart';
import 'package:ehsan_store/screens/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ehsan Store',
      theme: ThemeData(
        hintColor: Colors.white10,
        accentColor: Color(0xfF0496E2),
        primaryColor: Color(0xfF474546),
      ),
      debugShowCheckedModeBanner: false,
      home:FavoritesScreen(),
    );
  }
}
