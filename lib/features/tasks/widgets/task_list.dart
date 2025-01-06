import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/features/tasks/widgets/no_task.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    this.showCreateTaskButton = false,
    this.emptyTasksMessage,
    this.changeTaskStatus,
    required this.tasks,
    this.deleteTask,
  });

  final Function(Task task)? changeTaskStatus;
  final Function(Task task)? deleteTask;
  final String? emptyTasksMessage;
  final bool showCreateTaskButton;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tasks.isNotEmpty,
      replacement: _noTask(),
      child: Expanded(
        child: _taskList(tasks),
      ),
    );
  }

  Widget _taskList(List<Task> tasks) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Column(
          children: [
            TaskiItem(
              task: task,
              changeTaskStatus: () => changeTaskStatus?.call(task),
              deleteTask: () => deleteTask?.call(task),
            ),
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
      margin: EdgeInsets.only(top: Get.height * (showCreateTaskButton ? 0.2 : 0.25)),
      alignment: Alignment.center,
      child: NoTask(feedback: emptyTasksMessage, showCreateTaskButton: showCreateTaskButton),
    );
  }
}
