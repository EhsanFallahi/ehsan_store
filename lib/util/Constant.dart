import 'package:flutter/material.dart';
import 'package:get/get.dart';

const PRIMARY_COLOR=Color(0xfF474546);
const SECONDARY_COLOR=Color(0xff0496E2);
BoxDecoration gradientBackground() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xfF000000), Color(0xfF474546)],
    ),
  );
}
void showCustomSnackBar(String title,String subtitle) =>
    Get.snackbar('$title', '$subtitle',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(8),
        colorText: Theme.of(Get.context).accentColor,
        backgroundColor: Colors.black87.withOpacity(0.8));

const PADDING_TEXTFORFIELD=EdgeInsets.only(left: 15, right: 15, top: 15);
