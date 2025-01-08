import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common/complete_task_flow.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

import 'common/create_task_flow.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void deleteTaskById() {
  testWidgets('delete task', (tester) async {
    await _initApp(tester);

    final String taskTitle = 'Task to delete';

    await createTaskCommon(tester, title: taskTitle);
    await completeTaskCommon(tester, taskTitle);

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
