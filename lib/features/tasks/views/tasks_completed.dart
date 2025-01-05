import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/task_list.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksCompleted extends StatelessWidget {
  TasksCompleted({super.key});

  final TaskViewModel taskViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          _title(),
          _list(),
        ],
      ),
    );
  }

  Widget _title() {
    return Visibility(
      visible: taskViewModel.completedTasks.isNotEmpty,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Completed Tasks',
            style: GoogleFonts.urbanist(
              color: TaskiColors.statePurple,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: () async {
              await taskViewModel.deleteCompletedTasks();
            },
            child: Text(
              'Delete All',
              style: GoogleFonts.urbanist(
                color: TaskiColors.fireRed,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _list() {
    return Obx(
      () {
        final List<Task> tasks = taskViewModel.completedTasks;

        tasks.sort((a, b) => a.date.compareTo(b.date));
        tasks.removeWhere((task) => !task.isCompleted);

        return TaskList(tasks: tasks, emptyTasksMessage: 'No completed tasks.');
      },
    );
  }
}
