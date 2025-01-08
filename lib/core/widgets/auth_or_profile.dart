import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/features/auth/views/profile.dart';
import 'package:taski/features/auth/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOrProfile extends StatelessWidget {
  const AuthOrProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: Get.find<AuthViewModel>().isLoggedIn,
        replacement: const AuthScreen(),
        child: Profile(),
      );
    });
  }
}
