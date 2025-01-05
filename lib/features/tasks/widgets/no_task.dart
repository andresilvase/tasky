import 'package:taski/features/tasks/views/create_task.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class NoTask extends StatelessWidget {
  const NoTask({super.key, this.feedback, this.showCreateTaskButton = true});

  final bool showCreateTaskButton;
  final String? feedback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          feedbackImage(),
          createTaskButton(context),
        ],
      ),
    );
  }

  Column feedbackImage() {
    return Column(
      spacing: 24,
      children: [
        // TODO: add image to assets constants
        Image.asset('assets/images/no-task.png'),
        Text(
          feedback ?? 'You have no task listed.',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.normal,
            color: TaskiColors.stateBlue,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  void onNewTask(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => CreateTask());
  }

  Visibility createTaskButton(BuildContext context) {
    return Visibility(
      visible: showCreateTaskButton,
      child: ElevatedButton.icon(
        label: Text(
          // TODO: get username from user model
          'Create Task',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w600,
            color: TaskiColors.blue,
            fontSize: 18,
          ),
        ),
        icon: Icon(Icons.add, color: TaskiColors.blue),
        onPressed: () => onNewTask(context),
        style: buttonStyle(),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: TaskiColors.blue10,
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
    );
  }
}
