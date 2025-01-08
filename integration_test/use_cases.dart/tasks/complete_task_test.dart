import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

import 'create_task_test.dart';

Future<void> initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void completeTask({String? title}) {
  final String taskTitle = title ?? 'Task to complete';

  createTask(title: taskTitle);
  _completeTask(taskTitle);
}

void _completeTask(String taskTitle) {
  testWidgets('complete task', (tester) async {
    await initApp(tester);

    final taskCard = find.text(taskTitle);
    expect(taskCard, findsOneWidget);

    final taskCardCheckbox = find.byType(TaskiItem);
    expect(taskCardCheckbox, findsWidgets);

    final taskCardCheckboxIcon = find.byKey(Key(WidgetsKeys.taskiItemCheckbox));
    expect(taskCardCheckboxIcon, findsWidgets);

    await tester.tap(taskCardCheckboxIcon.last);
    await tester.pumpAndSettle();

    final completedTasksNavIcon = find.byKey(Key(WidgetsKeys.navBarDoneIcon));
    expect(completedTasksNavIcon, findsOneWidget);

    await tester.tap(completedTasksNavIcon);
    await tester.pumpAndSettle();

    final completedTaskCard = find.text(taskTitle);
    expect(completedTaskCard, findsOneWidget);
  });
}
