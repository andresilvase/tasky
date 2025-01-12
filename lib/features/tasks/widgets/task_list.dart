import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/features/tasks/widgets/no_task.dart';
import 'package:tasky/features/tasks/model/task.dart';
import 'package:tasky/features/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    this.showCreateTaskButton = false,
    required this.marginTop,
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
  final double marginTop;

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
      padding: EdgeInsets.only(top: 32),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Column(
          children: [
            TaskiItem(
              changeTaskStatus: () => changeTaskStatus?.call(task),
              deleteTask: () => deleteTask?.call(task),
              task: task,
            ),
            _listBottomPadding(index, tasks),
          ],
        );
      },
    );
  }

  Widget _noTask() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: marginTop),
      child: NoTask(
        showCreateTaskButton: showCreateTaskButton,
        feedback: emptyTasksMessage,
        onNewTask: () {
          Get.find<HomeController>().changeIndex(1);
        },
      ),
    );
  }

  Visibility _listBottomPadding(int index, List<Task> tasks) {
    return Visibility(
      visible: index == tasks.length - 1,
      child: SizedBox(height: Get.width * 0.5),
    );
  }
}
