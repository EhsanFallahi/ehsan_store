import 'package:dio/dio.dart';
import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/data_source/model/user/User.dart';
import 'package:ehsan_store/data_source/repository/login/LoginRepository.dart';
import 'package:ehsan_store/screens/admin/product_detail/AdminProductDetailScreen.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class LoginController extends GetxController {

  List<dynamic> _allUsers = [];
  List<User> _tempListUsers = [];
  List<dynamic> _allAdmins = [];
  List<Admin> _tempListAdmins = [];

  @override
  void onInit() async {
    print('onInit login controller');
    try {
      await _loginRepository.getAdmin().then((response) {
        _allAdmins.addAll(response.data);
        print('onInit login admins is$_allAdmins');
      });
      await _loginRepository.getUser().then((response) {
        _allUsers.addAll(response.data);
        print('onInit login users is$_allUsers');
      });
    } catch (error) {
      print('network error:$error');
    } finally {
      print('onInit login is loading false');
      initialTempListAllUsers();
      initialTempListAllAdmins();
      isLoading(false);
    }
  }

  LoginRepository _loginRepository = LoginRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool changeDisplayPassword = false.obs;
  RxBool isLoading = false.obs;

  void loginPerson(String userName, String password) async {
      if (isValidateUser(userName, password)) {
        isLoading(false);
        Get.off(DashboardScreen(),arguments:userName );
      } else {
        showWarningSnackBar();
      }
      if (isValidateAdmin(userName, password)) {
        isLoading(false);
        Get.off(AdminProductDetailScreen(),arguments: userName);
      }
  }

  void initialTempListAllUsers() {
    for (var user in _allUsers) {
      User _tempUser = User();
      _tempUser.fromJson(user);
      _tempListUsers.add(_tempUser);
    }
  }

  void initialTempListAllAdmins() {
    for (var admin in _allAdmins) {
      Admin _tempAdmin = Admin();
      _tempAdmin.fromJson(admin);
      _tempListAdmins.add(_tempAdmin);
    }
  }

  void showWarningSnackBar()=>Get.snackbar('User Not Found!', 'Please Registration',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(8),
      colorText: Theme.of(Get.context).accentColor,
      backgroundColor: Colors.black87.withOpacity(0.8));

  bool isValidateUser(String userName,String password){
    bool validate=false;
    for (var user in _tempListUsers) {
      if (userName == user.userName &&
          password == user.password &&
          user.roll == 'user') {
        validate= true;
      }
    }
      return validate;

  }

  bool isValidateAdmin(String userName,String password){
    bool validate=false;
    for (var admin in _tempListAdmins) {
      if (userName == admin.userName &&
          password == admin.password &&
          admin.roll == 'admin') {
        validate= true;
      }
    }
    return validate;
    }

}
