import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/data_source/model/user/User.dart';
import 'package:ehsan_store/data_source/repository/login/LoginRepository.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetail.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  User _user = User();
  Admin _admin = Admin();
  LoginRepository _loginRepository = LoginRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool changeDisplayPassword = false.obs;
  RxBool isLoading = false.obs;
  RxBool isValidUser = false.obs;
  RxBool isValidAdmin = false.obs;
  RxString roll = ''.obs;

  void loginPerson(String userName, String password) async {
    isLoading(true);
    print('is loading true');
    try{
      await _loginRepository.getUser().then((response) {
        _user.fromJson(response.data[0]);
      });
      await _loginRepository.getAdmin().then((response) {
        _admin.fromJson(response.data[0]);
      });
    }finally{
      isLoading(false);
    }
    if (userName == _user.userName && password == _user.password) {
      isLoading(false);
      isValidUser(true);
      roll('user');
      Get.off(DashboardScreen());
      print('$_user');
    } else if (userName == _admin.userName &&
        password == _admin.password) {
      isLoading(false);
      isValidAdmin(true);
      roll('admin');
      print('$_admin');
      Get.off(AdminProductDetail());
    } else {
      isLoading(false);
      Get.snackbar('User Not Found!',
          'Please Registration',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87
      );
      isLoading(false);
      print('is loading false');
      print('user not found...please register');
    }
  }

}
