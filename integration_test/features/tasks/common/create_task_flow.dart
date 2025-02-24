import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasky/core/constants/widgets_keys.dart';

Future<void> createTaskCommon(WidgetTester tester, {String? title, String? taskDescription}) async {
  final createTaskButton = find.byKey(const Key(WidgetKeys.navBarAddIcon));
  expect(createTaskButton, findsOneWidget);

  await tester.tap(createTaskButton);
  await tester.pumpAndSettle();

  final taskTitle = title ?? 'Postar esse vídeo no Linkedin';

  final titleField = find.byKey(const Key(WidgetKeys.createTaskTitleInput));
  expect(titleField, findsOneWidget);

  await tester.enterText(titleField, taskTitle);
  await tester.pumpAndSettle();

  if (taskDescription != null) {
    final descriptionField = find.byKey(const Key(WidgetKeys.createTaskDescriptionInput));
    expect(descriptionField, findsOneWidget);

    await tester.enterText(descriptionField, taskDescription);
    await tester.pumpAndSettle();
  }

  final createTaskSubmitButton = find.byKey(const Key(WidgetKeys.createTaskSubmitButton));
  expect(createTaskSubmitButton, findsOneWidget);

  await tester.tap(createTaskSubmitButton);
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.navBarTodoIcon)));
  await tester.pumpAndSettle();

  final taskCard = find.text(taskTitle);
  expect(taskCard, findsOneWidget);
}
