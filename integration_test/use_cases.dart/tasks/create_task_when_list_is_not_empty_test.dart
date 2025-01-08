import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

Future<void> initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void createTaskWhenListIsNotEmpty({String? tastTitle, String? taskDescription}) {
  testWidgets('create a new task if the list is NOT empty', (tester) async {
    await initApp(tester);

    final createTaskButton = find.byKey(const Key(WidgetsKeys.navBarAddIcon));
    expect(createTaskButton, findsOneWidget);

    await tester.tap(createTaskButton);
    await tester.pumpAndSettle();

    final taskTitle = tastTitle ?? 'Test Task 2';

    final titleField = find.byKey(const Key(WidgetsKeys.createTaskTitleInput));
    expect(titleField, findsOneWidget);

    await tester.enterText(titleField, taskTitle);
    await tester.pumpAndSettle();

    if (taskDescription != null) {
      final descriptionField = find.byKey(const Key(WidgetsKeys.createTaskDescriptionInput));
      expect(descriptionField, findsOneWidget);

      await tester.enterText(descriptionField, taskDescription);
      await tester.pumpAndSettle();
    }

    final createTaskSubmitButton = find.byKey(const Key(WidgetsKeys.createTaskSubmitButton));
    expect(createTaskSubmitButton, findsOneWidget);

    await tester.tap(createTaskSubmitButton);
    await tester.pumpAndSettle();

    final taskCard = find.text(taskTitle);
    expect(taskCard, findsOneWidget);
  });
}
