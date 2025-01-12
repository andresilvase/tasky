import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../common/init_app.dart';

void createTaskWhenListIsEmpty() {
  testWidgets('create a new task if the list is empty', (tester) async {
    await initApp(tester);

    final createTaskButton = find.byKey(const Key(WidgetKeys.createTaskButton));
    expect(createTaskButton, findsOneWidget);

    await tester.tap(createTaskButton);
    await tester.pumpAndSettle();

    final titleField = find.byKey(const Key(WidgetKeys.createTaskTitleInput));
    expect(titleField, findsOneWidget);

    await tester.enterText(titleField, 'Ler a bíblia');
    await tester.pumpAndSettle();

    final descriptionField = find.byKey(const Key(WidgetKeys.createTaskDescriptionInput));
    expect(descriptionField, findsOneWidget);

    await tester.enterText(descriptionField, 'Jeremias 33:03');
    await tester.pumpAndSettle();

    final createTaskSubmitButton = find.byKey(const Key(WidgetKeys.createTaskSubmitButton));
    expect(createTaskSubmitButton, findsOneWidget);

    await tester.tap(createTaskSubmitButton);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.navBarTodoIcon)));
    await tester.pumpAndSettle();

    final taskCard = find.byType(TaskiItem);
    expect(taskCard, findsOneWidget);
  });
}
