import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

import 'complete_task_test.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void deleteTask() {
  final String taskTitle = 'Task to delete';

  completeTask(title: taskTitle);
  _deleteTask(taskTitle);
}

void _deleteTask(String taskTitle) {
  testWidgets('delete task', (tester) async {
    await _initApp(tester);

    final completedTasksNavIcon = find.byKey(Key(WidgetKeys.navBarDoneIcon));
    expect(completedTasksNavIcon, findsOneWidget);

    await tester.tap(completedTasksNavIcon);
    await tester.pumpAndSettle();

    late String taskToBeDeletedId;

    final completedTaskCard = find.byWidgetPredicate((Widget widget) {
      if (widget is TaskiItem) {
        taskToBeDeletedId = widget.task.id;
        return widget.task.title == taskTitle;
      }
      return false;
    });

    expect(completedTaskCard, findsOneWidget);

    final completedTaskCardCheckbox = find.byKey(Key(WidgetKeys.taskiItemDeleteButton(taskToBeDeletedId)));

    await tester.tap(completedTaskCardCheckbox);
    await tester.pumpAndSettle();

    expect(completedTaskCardCheckbox, findsNothing);
  });
}
