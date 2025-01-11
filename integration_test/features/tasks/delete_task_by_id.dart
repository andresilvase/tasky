import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common/complete_task_flow.dart';
import 'package:flutter/material.dart';

import 'common/create_task_flow.dart';

import '../common/init_app.dart';

void deleteTaskById() {
  testWidgets('delete task', (tester) async {
    await initApp(tester);

    final String taskTitle = 'Estudar Java';

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
