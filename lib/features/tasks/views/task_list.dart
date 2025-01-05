import 'package:taski/features/tasks/widgets/no_task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tasks = <Widget>[];

    return Column(
      crossAxisAlignment: tasks.isNotEmpty ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        _welcomeHeader(),
        taskList(tasks),
      ],
    );
  }

  Widget _welcomeHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          _welcomeMessage(),
          _taskSummary(),
        ],
      ),
    );
  }

  Widget _welcomeMessage() {
    return Row(
      spacing: 8,
      children: [
        Text(
          'Welcome,',
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          'André',
          style: GoogleFonts.urbanist(
            color: TaskiColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _taskSummary() {
    return Row(
      spacing: 8,
      children: [
        Text(
          'You\'ve got',
          style: GoogleFonts.urbanist(
            color: TaskiColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Text(
          '5 tasks',
          style: GoogleFonts.urbanist(
            color: TaskiColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Text(
          'to do.',
          style: GoogleFonts.urbanist(
            color: TaskiColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget taskList(List<Widget> tasks) {
    return Visibility(
      visible: tasks.isNotEmpty,
      replacement: Container(
        margin: EdgeInsets.only(top: Get.height * 0.2),
        alignment: Alignment.center,
        child: NoTask(),
      ),
      child: Expanded(
        child: ListView(
          children: [
            ...tasks,
            SizedBox(height: Get.width * 0.5),
          ],
        ),
      ),
    );
  }
}
