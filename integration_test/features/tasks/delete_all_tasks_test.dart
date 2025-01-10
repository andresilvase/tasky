import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common/complete_task_flow.dart';
import 'package:flutter/material.dart';
import 'common/create_task_flow.dart';
import 'package:tasky/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void deleteAllTasksAtOnce() {
  testWidgets('delete all tasks at once', (tester) async {
    await _initApp(tester);

    for (int i = 1; i <= 3; i++) {
      final String taskTitle = 'Task to delete $i';

      await createTaskCommon(tester, title: taskTitle);
      await completeTaskCommon(tester, taskTitle);
    }

    final deleteAllButton = find.byKey(Key(WidgetKeys.deleteAllCompletedTasksButton));
    expect(deleteAllButton, findsOneWidget);

    await tester.tap(deleteAllButton);
    await tester.pumpAndSettle();

    final taskCard = find.byType(TaskiItem);
    expect(taskCard, findsNothing);
  });
}
