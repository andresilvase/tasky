import 'package:taski/features/tasks/views/create_task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> createTaskBottomSheet(BuildContext context) async {
  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return showModalBottomSheet(
    backgroundColor: isDarkMode ? null : TaskiColors.white,
    builder: (context) => CreateTask(),
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: Get.height * 0.7,
    ),
    useSafeArea: true,
    context: context,
  );
}
