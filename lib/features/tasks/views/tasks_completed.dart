import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/base_screen.dart';
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
    return BaseScreen(
      children: [
        _title(),
        _list(),
      ],
    );
  }

  Widget _title() {
    return Obx(
      () => Visibility(
        visible: taskViewModel.completedTasks.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
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
        ),
      ),
    );
  }

  Widget _list() {
    return Obx(
      () {
        final List<Task> tasks = taskViewModel.completedTasks;

        tasks.sort((a, b) => a.date.compareTo(b.date));
        tasks.removeWhere((task) => !task.isCompleted);

        return TaskList(
          changeTaskStatus: (task) => taskViewModel.changeTaskStatus(task),
          deleteTask: (task) => taskViewModel.deleteTask(task),
          emptyTasksMessage: 'No completed tasks.',
          tasks: tasks,
        );
      },
    );
  }
}
