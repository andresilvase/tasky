import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'common/create_task_flow.dart';

import '../common/init_app.dart';

void searchTaskByTitle() {
  testWidgets('search task', (tester) async {
    await initApp(tester);

    final String taskTitle = 'Lavar o carro';

    await createTaskCommon(tester, title: taskTitle);

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
