import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/features/tasks/widgets/no_task.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});

  final TaskViewModel taskViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _welcomeHeader(),
        taskList(),
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
          // TODO: get username from user model
          'Welcome,',
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          // TODO: get username from user model
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
          // TODO: get task count from task model
          'You\'ve got',
          style: GoogleFonts.urbanist(
            color: TaskiColors.stateBlue,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        Obx(
          () => Text(
            // TODO: get task count from task model
            '${taskViewModel.uncompletedTasks} tasks',
            style: GoogleFonts.urbanist(
              color: TaskiColors.stateBlue,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          // TODO: get task count from task model
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

  Widget taskList() {
    return StreamBuilder<List<Task>>(
      stream: taskViewModel.getTasksStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final tasks = snapshot.data!;
          tasks.sort((a, b) => a.date.compareTo(b.date));
          tasks.removeWhere((task) => task.isCompleted);

          return Visibility(
            visible: tasks.isNotEmpty,
            replacement: _noTask(),
            child: Expanded(
              child: _taskList(tasks),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _taskList(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Column(
          children: [
            TaskiItem(task: task),
            Visibility(
              visible: index == tasks.length - 1,
              child: SizedBox(height: Get.width * 0.5),
            ),
          ],
        );
      },
    );
  }

  Widget _noTask() {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.2),
      alignment: Alignment.center,
      child: NoTask(),
    );
  }
}
