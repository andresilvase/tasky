import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:tasky/features/auth/views/profile.dart';
import 'package:tasky/features/auth/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOrProfile extends StatelessWidget {
  const AuthOrProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Get.find<AuthViewModel>();

    return Obx(() {
      return Visibility(
        replacement: const AuthScreen(),
        visible: authViewModel.isLoggedIn,
        child: Profile(),
      );
    });
  }
}
