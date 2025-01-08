import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

import 'complete_task_test.dart';

Future<void> initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void deleteAllTasksAtOnce() {
  final String taskTitle = 'Task to delete';

  for (int i = 1; i <= 3; i++) {
    completeTask(title: '$taskTitle $i');
  }

  _deleteAllAtOnce();
}

void _deleteAllAtOnce() {
  testWidgets('delete all tasks at once', (tester) async {
    await initApp(tester);

    final deleteAllButton = find.byKey(Key(WidgetsKeys.deleteAllCompletedTasksButton));
    expect(deleteAllButton, findsOneWidget);

    await tester.tap(deleteAllButton);
    await tester.pumpAndSettle();

    final taskCard = find.byType(TaskiItem);
    expect(taskCard, findsNothing);
  });
}
