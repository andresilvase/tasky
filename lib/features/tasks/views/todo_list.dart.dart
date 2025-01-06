import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/base_screen.dart';
import 'package:taski/features/tasks/widgets/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final TaskViewModel taskViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: [
        _welcomeHeader(),
        _list(),
      ],
    );
  }

  Widget _welcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        SizedBox(height: 24),
        _welcomeMessage(),
        _taskSummary(),
      ],
    );
  }

  Widget _welcomeMessage() {
    return Row(
      spacing: 8,
      children: [
        Text(
          AppLocalizations.of(Get.context!)!.welcome,
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
    return Obx(() {
      final int taskCount = taskViewModel.todoTasks.length;
      String summaryText = '';

      if (taskCount == 0) {
        summaryText = AppLocalizations.of(Get.context!)!.createTasks;
      } else {
        summaryText = AppLocalizations.of(Get.context!)!.youveGot(taskCount);
      }

      return Text(
        summaryText,
        style: GoogleFonts.urbanist(
          color: TaskiColors.stateBlue,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      );
    });
  }

  Widget _list() {
    return Obx(() {
      final List<Task> tasks = taskViewModel.todoTasks;
      tasks.sort((a, b) => a.date.compareTo(b.date));
      tasks.removeWhere((task) => task.isCompleted);

      return TaskList(
        changeTaskStatus: (task) {
          taskViewModel.changeTaskStatus(task);
        },
        showCreateTaskButton: true,
        marginTop: Get.height * 0.15,
        tasks: tasks,
      );
    });
  }
}
