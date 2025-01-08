import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

import 'create_task_test.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void searchTaskByTitle() {
  final String taskTitle = 'Task to search';

  createTask(title: taskTitle);
  _searchTaskByTitle(taskTitle);
}

void _searchTaskByTitle(String taskTitle) {
  testWidgets('search task', (tester) async {
    await _initApp(tester);

    final taskCard = find.text(taskTitle);
    expect(taskCard, findsOneWidget);

    final taskCardCheckbox = find.byType(TaskiItem);
    expect(taskCardCheckbox, findsWidgets);

    final taskCardCheckboxIcon = find.byKey(Key(WidgetKeys.taskiItemCheckbox));
    expect(taskCardCheckboxIcon, findsWidgets);

    await tester.tap(taskCardCheckboxIcon.last);
    await tester.pumpAndSettle();

    final searchTasksNavIcon = find.byKey(Key(WidgetKeys.navBarSearchIcon));
    expect(searchTasksNavIcon, findsOneWidget);

    await tester.tap(searchTasksNavIcon);
    await tester.pumpAndSettle();

    final searchTaskInput = find.byKey(Key(WidgetKeys.searchTaskInput));
    expect(searchTaskInput, findsOneWidget);

    await tester.enterText(searchTaskInput, taskTitle);
    await tester.pumpAndSettle();

    final searchTaskInputText = find.byWidgetPredicate((Widget widget) {
      if (widget is TaskiItem) {
        return widget.task.title == taskTitle;
      }
      return false;
    });

    expect(searchTaskInputText, findsOneWidget);
    await tester.pumpAndSettle();
  });
}
