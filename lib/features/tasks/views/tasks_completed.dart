import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/base_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BaseScreen(
      children: [
        _title(isDarkMode),
        _list(),
      ],
    );
  }

  Widget _title(bool isDarkMode) {
    return Obx(
      () => Visibility(
        visible: taskViewModel.completedTasks.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(Get.context!)!.completedTasks,
                style: GoogleFonts.urbanist(
                  color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await taskViewModel.deleteCompletedTasks();
                },
                child: Text(
                  AppLocalizations.of(Get.context!)!.deleteAll,
                  style: GoogleFonts.urbanist(
                    color: isDarkMode ? TaskiColors.redShade : TaskiColors.fireRed,
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
          emptyTasksMessage: AppLocalizations.of(Get.context!)!.noCompletedTasks,
          changeTaskStatus: (task) => taskViewModel.changeTaskStatus(task),
          deleteTask: (task) => taskViewModel.deleteTask(task),
          marginTop: Get.height * 0.25,
          tasks: tasks,
        );
      },
    );
  }
}
