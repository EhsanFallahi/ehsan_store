import 'package:ehsan_store/data_source/model/admin/Admin.dart';
import 'package:ehsan_store/data_source/model/product/Product.dart';
import 'package:ehsan_store/data_source/repository/admin/AdminReposoitoty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  AdminRepository _adminRepository = AdminRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool changeDisplayPassword = false.obs;
  RxBool isLoading = false.obs;
  RxBool isAddedAdmin = false.obs;


  List<dynamic> _allAdmins = [];
  var tempListAdmins = List<Admin>().obs();

  @override
  void onInit() async {
    getALLAdmins();
  }

  void registerAdmin(Admin admin) async {
    try {
      isLoading(true);
      await _adminRepository.addAdmin(admin);
      tempListAdmins.add(admin);
      isAddedAdmin(true);
      print('admin  added!');
      showAddedAdminSnackBar();
      cleanTextFeilds();
      // Get.off(DashboardScreen());
    } catch (error) {
      isAddedAdmin(false);
      print('network error:$error');
    } finally {
      isLoading(false);
    }
  }

  void getALLAdmins() {
    if (isAddedAdmin.value) {
      return;
    } else {
      try {
        isLoading(true);
        _adminRepository.getAllAdmins().then((response) {
          isAddedAdmin(true);
          isLoading(false);
          _allAdmins.addAll(response.data);
          initialTempListAllAdmins();
          print('onInit admins is$tempListAdmins');
        });
      } catch (error) {
        isAddedAdmin(false);
        isLoading(false);
        print('network error:$error');
      }
    }
  }


  void deleteAdmin(Admin admin)async{
    isLoading(true);
    try{
      await _adminRepository.deleteAdmin(admin);
      print('deleted product');
      showDeletedAdminSnackBar();
    }catch(error){
      isLoading(false);
      print('network error:$error');
    }finally{
      isLoading(false);
    }
  }

  void initialTempListAllAdmins() {
    for (var admin in _allAdmins) {
      Admin _tempAdmin = Admin();
      _tempAdmin.fromJson(admin);
      tempListAdmins.add(_tempAdmin);
    }
  }

  void showAddedAdminSnackBar() =>
      Get.snackbar('Admin Added', 'You have added a new admin',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));

  void cleanTextFeilds() {
    usernameController.text = '';
    passwordController.text = '';
  }

  void showDeletedAdminSnackBar()=>
      Get.snackbar('Admin Deleted', 'You have Deleted a Admin',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(8),
          colorText: Theme.of(Get.context).accentColor,
          backgroundColor: Colors.black87.withOpacity(0.8));
}
