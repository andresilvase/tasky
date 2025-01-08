import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/features/auth/views/profile.dart';
import 'package:taski/features/auth/model/user.dart';
import 'package:taski/features/auth/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthOrProfile extends StatefulWidget {
  const AuthOrProfile({super.key});

  @override
  State<AuthOrProfile> createState() => _AuthOrHomeState();
}

class _AuthOrHomeState extends State<AuthOrProfile> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: Get.find<AuthViewModel>().activeUser.value == User.empty(),
        replacement: Profile(),
        child: const AuthScreen(),
      );
    });
  }
}
