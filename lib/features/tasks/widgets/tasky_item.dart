import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskiItem extends StatelessWidget {
  const TaskiItem({
    super.key,
    this.onTaskComplete,
    this.uncompleteTask,
    required this.task,
  });

  final Function()? onTaskComplete;
  final Function()? uncompleteTask;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return _builder();
  }

  Widget _builder() {
    return _background();
  }

  Widget _background() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: TaskiColors.paleWhite,
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
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            visualDensity: const VisualDensity(vertical: -4),
            activeColor: task.isCompleted ? TaskiColors.mutedAzure : TaskiColors.blue,
            onChanged: (_) => onTaskComplete?.call(),
            checkColor: TaskiColors.paleWhite,
            value: task.isCompleted,
            side: const BorderSide(
              color: TaskiColors.mutedAzure,
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
            color: task.isCompleted ? TaskiColors.stateBlue : TaskiColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Visibility(
          visible: task.isCompleted,
          child: IconButton(
            icon: Icon(Icons.delete, color: TaskiColors.fireRed),
            onPressed: uncompleteTask,
          ),
        )
      ],
    );
  }

  Widget _description() {
    return Visibility(
      visible: task.description != null && task.description!.isNotEmpty,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 32),
            width: Get.width * 0.76,
            child: Text(
              task.description ?? "",
              style: GoogleFonts.urbanist(
                color: TaskiColors.stateBlue,
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
