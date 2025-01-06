import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/features/auth/model/user.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  Future<User?> init() async {
    final AuthViewModel authViewModel = Get.find<AuthViewModel>();
    await authViewModel.init();

    return authViewModel.activeUser;
  }

  void navigate(User? user) {
    print(user);
    if (user != null) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init().then(navigate),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const SizedBox();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
