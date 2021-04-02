import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/data_source/model/user/User.dart';
import 'package:ehsan_store/data_source/repository/login/LoginRepository.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  LoginRepository _loginRepository = LoginRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RxBool changeDisplayPassword = false.obs;
  RxBool isLoading = false.obs;

  void registerUser(User user, String confirmPassword) async {
    isLoading(true);
    await _registerUser(user, confirmPassword);
  }

  Future _registerUser(User user, String confirmPassword) async {
    if (user.password == confirmPassword) {
      try {
        await _loginRepository.addUser(user);
        cleanTextFeilds();
        Get.off(DashboardScreen(), arguments: user.userName);
      } finally {
        isLoading(false);
      }
    } else if (user.password != confirmPassword) {
      isLoading(false);
      showCustomSnackBar(
          'please_enter_corectly'.tr, 'please_enter_corectly'.tr);
    }
  }

  void cleanTextFeilds() {
    usernameController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }
}
