import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthBackgroundCard extends StatelessWidget {
  const AuthBackgroundCard({
    super.key,
    required this.isToExpand,
    required this.children,
  });

  final List<Widget> children;
  final bool isToExpand;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        height: (isToExpand ? Get.width * 1.2 : Get.width),
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
