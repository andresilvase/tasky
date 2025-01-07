import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/features/auth/views/auth.dart';
import 'package:taski/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: Get.find<AuthViewModel>().activeUser == null,
        replacement: Home(),
        child: const AuthScreen(),
      );
    });
  }
}
