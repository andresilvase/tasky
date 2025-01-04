import 'package:tasky/features/home/home_controller.dart';
import 'package:tasky/custom_bottom_navigator.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:tasky/features/task_list.dart';
import 'package:flutter/material.dart';
import 'package:tasky/header.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    final pages = <Widget>[
      TaskList(),
      Container(),
      Container(),
      Container(),
    ];

    return Scaffold(
      backgroundColor: TaskyColors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            SizedBox(
              height: Get.height * .8,
              child: IndexedStack(
                index: controller.currentIndex,
                children: pages,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigator(
          currentIndex: controller.currentIndex,
          onIndexChanged: controller.changeIndex,
        ),
      ),
    );
  }
}
