import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/utils/extensions.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskiItem extends StatelessWidget {
  const TaskiItem({
    super.key,
    this.changeTaskStatus,
    required this.task,
    this.deleteTask,
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
        color: isDarkMode ? TaskiColors.statePurple : TaskiColors.paleWhite,
        borderRadius: BorderRadius.circular(10),
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
    late final Color iconColor;

    if (task.isCompleted) {
      textColor = isDarkMode ? TaskiColors.mutedAzure : TaskiColors.stateBlue;
      iconColor = isDarkMode ? TaskiColors.black : TaskiColors.mutedAzure;
    } else {
      textColor = isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple;
      iconColor = task.isCompleted ? TaskiColors.black : TaskiColors.blue;
    }

    CrossAxisAlignment crossAxisAlignment =
        !task.description.isNotEmptyNeighterNull() ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        _checkBox(iconColor, isDarkMode),
        _inputTitle(textColor),
        Spacer(),
        _deleteTaskButton(isDarkMode),
        _moreIcon()
      ],
    );
  }

  Transform _checkBox(Color iconColor, bool isDarkMode) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        key: Key(WidgetsKeys.taskiItemCheckbox),
        visualDensity: const VisualDensity(vertical: -4),
        activeColor: iconColor,
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
    );
  }

  Expanded _inputTitle(Color textColor) {
    return Expanded(
      flex: task.title.length,
      child: Text(
        task.title,
        style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

  Visibility _deleteTaskButton(bool isDarkMode) {
    return Visibility(
      visible: task.isCompleted,
      child: InkWell(
        key: Key(WidgetsKeys.taskiItemDeleteButton(task.id)),
        onTap: deleteTask,
        child: Icon(Icons.delete, color: isDarkMode ? TaskiColors.redShade : TaskiColors.fireRed),
      ),
    );
  }

  Visibility _moreIcon() {
    return Visibility(
      visible: !task.isCompleted && (task.description == null || task.description!.isEmpty),
      child: Icon(Icons.more_horiz, color: TaskiColors.mutedAzure),
    );
  }

  Widget _description() {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;
    late final Color textColor;

    if (task.isCompleted) {
      textColor = isDarkMode ? TaskiColors.mutedAzure : TaskiColors.stateBlue;
    } else {
      textColor = isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple;
    }

    return Visibility(
      visible: task.description != null && task.description!.isNotEmpty,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50),
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
