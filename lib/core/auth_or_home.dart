import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/features/auth/model/user.dart';
import 'package:taski/features/auth/views/auth.dart';
import 'package:taski/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOrHome extends StatefulWidget {
  const AuthOrHome({super.key});

  @override
  State<AuthOrHome> createState() => _AuthOrHomeState();
}

class _AuthOrHomeState extends State<AuthOrHome> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: Get.find<AuthViewModel>().activeUser.value == User.empty(),
        replacement: Home(),
        child: const AuthScreen(),
      );
    });
  }
}
