import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  void toggleTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = Get.isDarkMode;
    setStatusBarColor();
  }

  void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Get.isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Get.isDarkMode ? TaskiColors.black : TaskiColors.white,
        statusBarIconBrightness: Get.isDarkMode ? Brightness.light : Brightness.dark,
        statusBarColor: Get.isDarkMode ? TaskiColors.black : TaskiColors.white,
        systemNavigationBarContrastEnforced: true,
      ),
    );
  }
}
