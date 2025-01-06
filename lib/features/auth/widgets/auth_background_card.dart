import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthBackgroundCard extends StatelessWidget {
  const AuthBackgroundCard({super.key, required this.children, required this.isLogin});

  final List<Widget> children;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        height: (isLogin ? Get.width * .85 : Get.width),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TaskiColors.blue10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
