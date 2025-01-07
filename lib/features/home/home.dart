import 'package:taski/features/tasks/widgets/create_task_bottom_sheet.dart';
import 'package:taski/features/home/custom_bottom_navigator.dart';
import 'package:taski/features/tasks/views/tasks_completed.dart';
import 'package:taski/features/tasks/views/todo_list.dart.dart';
import 'package:taski/features/tasks/views/search_task.dart';
import 'package:taski/features/home/controller.dart';
import 'package:taski/core/widgets/header.dart';
import '../tasks/views/create_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    homeController.setStatusBarColor();

    final pages = <Widget>[
      TodoList(),
      CreateTask(),
      SearchTask(),
      TasksCompleted(),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
