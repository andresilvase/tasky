import 'package:tasky/features/tasks/widgets/tasky_item.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common/complete_task_flow.dart';
import 'package:flutter/material.dart';
import 'common/create_task_flow.dart';
import '../common/init_app.dart';

void deleteAllTasksAtOnce() {
  testWidgets('delete all tasks at once', (tester) async {
    await initApp(tester);

    final List<String> taskTitles = [
      'Praticar Inglês no Episoden',
      'Estudar Testes Automatizados',
      'Procurar Jobs na Gringa'
    ];

    for (final String taskTitle in taskTitles) {
      await createTaskCommon(tester, title: taskTitle);
      await Future.delayed(const Duration(seconds: 1));
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
