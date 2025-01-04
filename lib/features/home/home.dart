import 'package:tasky/custom_bottom_navigator.dart';
import 'package:tasky/features/task_list.dart';
import 'package:flutter/material.dart';
import 'package:tasky/header.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            SizedBox(
              height: Get.height * .8,
              child: IndexedStack(
                index: 0,
                children: [
                  TaskList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigator(),
    );
  }
}
