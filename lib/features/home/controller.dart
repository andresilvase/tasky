import 'package:taski/core/constants/colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }

  void backToHome() {
    changeIndex(0);
  }

  void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: TaskiColors.blue,
      ),
    );
  }
}
