import 'package:ehsan_store/controller/lang_controller/LanguageController.dart';
import 'package:ehsan_store/controller/login_controller/LoginController.dart';
import 'package:ehsan_store/data_source/model/lang/Language.dart';
import 'package:ehsan_store/screens/dashboard/DashboardScreen.dart';
import 'package:ehsan_store/util/Constant.dart';
import 'package:ehsan_store/widgets/HeaderWithoutSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetting extends StatelessWidget {
  LoginController get _loginController => Get.find<LoginController>();

  LanguageController get _lanaguageController => Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LanguageController>(() => LanguageController());
    final appBar = AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: cancelButtonAppBar(),
      actions: [saveButtonAppBar()],
    );
    return Scaffold(
      appBar: appBar,
      body: Obx(() => mainBody(context)),
    );
  }

  Container mainBody(BuildContext context) {
    return Container(
      decoration: gradientBackground(),
      child: Column(
        children: [
          HeaderWithoutSearch(
            title: 'setting'.tr,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: selectLanguageItem(context),
              ),
            ],
          ),
          editProfileItem(),
        ],
      ),
    );
  }

  Padding editProfileItem() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: editProfileButton(),
    );
  }

  SizedBox editProfileButton() {
    return SizedBox(
      height: 40,
      width: 140,
      child: ElevatedButton(
        child: Text('edit_profile'.tr),
        onPressed: () {},
        style: buttonStyle(),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xfF0496E2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            roundedRectangleBorder()));
  }

  RoundedRectangleBorder roundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  Row selectLanguageItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        titleLanguage(),
        selecetFaItem(context),
        selectEnItem(context),
      ],
    );
  }

  Column selectEnItem(BuildContext context) {
    return Column(
      children: [titleEN(), enHandleBoxDecoration(context)],
    );
  }

  Column selecetFaItem(BuildContext context) {
    return Column(
      children: [
        titleFA(),
        faHandleBoxDecoration(context),
      ],
    );
  }

  Text titleEN() {
    return Text(
      'EN',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
    );
  }

  GestureDetector faHandleBoxDecoration(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _loginController.faCheckBoxSelected.value = true;
        _loginController.enCheckBoxSelected.value = false;
      },
      child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: _loginController.faCheckBoxSelected.value
                  ? Theme.of(context).accentColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: _loginController.faCheckBoxSelected.value
                  ? null
                  : Border.all(color: Theme.of(context).accentColor, width: 2)),
          child: _loginController.faCheckBoxSelected.value
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null),
    );
  }

  GestureDetector enHandleBoxDecoration(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _loginController.faCheckBoxSelected.value = false;
        _loginController.enCheckBoxSelected.value = true;
      },
      child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: _loginController.enCheckBoxSelected.value
                  ? Theme.of(context).accentColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: _loginController.enCheckBoxSelected.value
                  ? null
                  : Border.all(color: Theme.of(context).accentColor, width: 2)),
          child: _loginController.enCheckBoxSelected.value
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null),
    );
  }

  Text titleFA() {
    return Text(
      'FA',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white70),
    );
  }

  Text titleLanguage() {
    return Text(
      'language'.tr,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 1,
          color: Colors.white70),
    );
  }

  Padding saveButtonAppBar() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: TextButton(
        onPressed: () {
          if (_loginController.faCheckBoxSelected.value) {
            Get.updateLocale(Locale('fa', 'IR'));
            _lanaguageController.updateLanguage(Language(id: 1, en: false));
            showCustomSnackBar('Changed Language',
                'The language of the application was changed to Persian');
            Get.to(DashboardScreen());
          } else {
            Get.updateLocale(Locale('en', 'US'));
            _lanaguageController.updateLanguage(Language(id: 1, en: true));
            Get.to(DashboardScreen());
            showCustomSnackBar('Changed Language',
                'The language of the application was changed to English');
          }
        },
        child: Text(
          'save'.tr,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Padding cancelButtonAppBar() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: TextButton(
        onPressed: () {
          Get.off(() => DashboardScreen());
        },
        child: Text(
          'cancel'.tr,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
