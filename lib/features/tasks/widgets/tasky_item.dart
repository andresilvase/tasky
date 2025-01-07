import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskiItem extends StatelessWidget {
  const TaskiItem({
    super.key,
    this.changeTaskStatus,
    this.deleteTask,
    required this.task,
  });

  final Function()? changeTaskStatus;
  final Function()? deleteTask;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return _builder();
  }

  Widget _builder() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _background(),
    );
  }

  Widget _background() {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDarkMode ? TaskiColors.statePurple : TaskiColors.paleWhite,
      ),
      child: _contentBuilder(),
    );
  }

  Widget _contentBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(),
        _description(),
      ],
    );
  }

  Widget _title() {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;
    late final Color textColor;

    if (task.isCompleted) {
      textColor = isDarkMode ? TaskiColors.mutedAzure : TaskiColors.mutedAzure;
    } else {
      textColor = isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple;
    }

    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            visualDensity: const VisualDensity(vertical: -4),
            activeColor: task.isCompleted ? TaskiColors.black : TaskiColors.blue,
            onChanged: (_) => changeTaskStatus?.call(),
            checkColor: TaskiColors.paleWhite,
            value: task.isCompleted,
            side: BorderSide(
              color: isDarkMode ? TaskiColors.paleWhite50 : TaskiColors.mutedAzure,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Text(
          task.title,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w600,
            color: textColor,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Visibility(
          visible: task.isCompleted,
          child: GestureDetector(
            onTap: deleteTask,
            child: Icon(Icons.delete, color: isDarkMode ? TaskiColors.redShade : TaskiColors.fireRed),
          ),
        ),
        Visibility(
          visible: !task.isCompleted && (task.description == null || task.description!.isEmpty),
          child: Icon(Icons.more_horiz, color: TaskiColors.mutedAzure),
        )
      ],
    );
  }

  Widget _description() {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;
    late final Color textColor;

    if (task.isCompleted) {
      textColor = isDarkMode ? TaskiColors.mutedAzure : TaskiColors.mutedAzure;
    } else {
      textColor = isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple;
    }

    return Visibility(
      visible: task.description != null && task.description!.isNotEmpty,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 48),
            width: Get.width * 0.76,
            child: Text(
              task.description ?? "",
              style: GoogleFonts.urbanist(
                color: textColor,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 4)
        ],
      ),
    );
  }
}
