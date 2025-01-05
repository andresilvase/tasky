import 'package:tasky/features/tasks/views/task_list.dart';
import 'package:tasky/features/home/home_controller.dart';
import 'package:tasky/features/home/custom_bottom_navigator.dart';
import 'package:tasky/core/constants/colors.dart';
import '../tasks/views/create_task.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/widgets/header.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    final pages = <Widget>[
      TaskList(),
      CreateTask(),
      Container(),
      Container(),
    ];

    return Scaffold(
      backgroundColor: TaskyColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppHeader(),
              SizedBox(
                height: Get.height,
                child: Obx(
                  () => IndexedStack(
                    index: controller.currentIndex,
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
          onIndexChanged: (index) {
            if (index == 1) {
              showModalBottomSheet(context: context, builder: (context) => CreateTask());
            } else {
              controller.changeIndex(index);
            }
          },
          currentIndex: controller.currentIndex,
        ),
      ),
    );
  }
}
