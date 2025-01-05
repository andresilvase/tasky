import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/tasks/widgets/task_list.dart';
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
    return Column(
      children: [
        _welcomeHeader(),
        _list(),
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
    return Obx(() {
      final int taskCount = taskViewModel.uncompletedTasks;
      String summaryText = '';

      if (taskCount == 0) {
        summaryText = 'Create tasks to achieve more.';
      } else {
        summaryText = 'You have $taskCount tasks to do';
      }

      return Text(
        // TODO: get task count from task model
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
    return StreamBuilder<List<Task>>(
      stream: taskViewModel.todoListStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final tasks = snapshot.data!;
          tasks.sort((a, b) => a.date.compareTo(b.date));
          tasks.removeWhere((task) => task.isCompleted);

          return TaskList(
            onTaskComplete: (task) {
              taskViewModel.completeTask(task);
            },
            showCreateTaskButton: true,
            tasks: tasks,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
