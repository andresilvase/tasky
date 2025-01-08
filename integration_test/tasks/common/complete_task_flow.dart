import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> completeTaskCommon(WidgetTester tester, String taskTitle) async {
  final taskCard = find.text(taskTitle);
  expect(taskCard, findsOneWidget);

  final taskCardCheckbox = find.byType(TaskiItem);
  expect(taskCardCheckbox, findsWidgets);

  final taskCardCheckboxIcon = find.byKey(Key(WidgetKeys.taskiItemCheckbox));
  expect(taskCardCheckboxIcon, findsWidgets);

  await tester.tap(taskCardCheckboxIcon.last);
  await tester.pumpAndSettle();

  final completedTasksNavIcon = find.byKey(Key(WidgetKeys.navBarDoneIcon));
  expect(completedTasksNavIcon, findsOneWidget);

  await tester.tap(completedTasksNavIcon);
  await tester.pumpAndSettle();

  final completedTaskCard = find.text(taskTitle);
  expect(completedTaskCard, findsOneWidget);
}
