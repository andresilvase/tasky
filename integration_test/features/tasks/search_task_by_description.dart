import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'common/create_task_flow.dart';
import '../common/init_app.dart';

void searchTaskByDescription() {
  testWidgets('search task', (tester) async {
    await initApp(tester);

    final String taskTitle = 'Ir a academia';
    final String taskDescription = 'Treinão de Peito e Tríceps';

    await createTaskCommon(tester, title: taskTitle, taskDescription: taskDescription);

    final taskCard = find.text(taskDescription);
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

    await tester.enterText(searchTaskInput, taskDescription);
    await tester.pumpAndSettle();

    final searchTaskInputText = find.byWidgetPredicate((Widget widget) {
      if (widget is TaskiItem) {
        return widget.task.description == taskDescription;
      }
      return false;
    });

    expect(searchTaskInputText, findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.navBarAddIcon)));
    await tester.pumpAndSettle();
  });
}
