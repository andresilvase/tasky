import 'package:taski/core/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void initializeTheme() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    isDarkMode.value = brightness == Brightness.dark;
    setStatusBarColor();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    setStatusBarColor();
  }

  void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: isDarkMode.value ? Brightness.light : Brightness.dark,
        statusBarColor: isDarkMode.value ? TaskiColors.black : TaskiColors.white,
      ),
    );
  }
}
