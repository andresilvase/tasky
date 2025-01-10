import 'package:tasky/features/tasks/widgets/create_task_bottom_sheet.dart';
import 'package:tasky/features/home/custom_bottom_navigator.dart';
import 'package:tasky/features/tasks/views/tasks_completed.dart';
import 'package:tasky/features/tasks/views/todo_list.dart.dart';
import 'package:tasky/features/tasks/views/search_task.dart';
import 'package:tasky/features/home/controller.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:tasky/core/theme/controller.dart';
import 'package:tasky/core/widgets/header.dart';
import '../tasks/views/create_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final HomeController homeController = Get.find();

    themeController.setStatusBarColor();

    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final pages = <Widget>[
      TodoList(),
      CreateTask(),
      SearchTask(),
      TasksCompleted(),
    ];

    return Scaffold(
      backgroundColor: isDarkMode ? null : TaskiColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(visible: Platform.isAndroid, child: SizedBox(height: 16)),
              AppHeader(),
              SizedBox(
                height: Get.height,
                child: Obx(
                  () => IndexedStack(
                    index: homeController.currentIndex,
                    children: pages,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigator(
          onIndexChanged: (index) async {
            if (index == 1) {
              await createTaskBottomSheet(context);
              homeController.backToHome();
            } else {
              homeController.changeIndex(index);
            }
          },
          currentIndex: homeController.currentIndex,
        ),
      ),
    );
  }
}
