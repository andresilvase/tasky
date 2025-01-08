import 'package:flutter_test/flutter_test.dart';
import 'common/complete_task_flow.dart';
import 'common/create_task_flow.dart';
import 'package:taski/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void completeTask({String? title}) {
  testWidgets('complete task', (tester) async {
    await _initApp(tester);

    final String taskTitle = title ?? 'Task to complete';

    await createTaskCommon(tester, title: taskTitle);
    await completeTaskCommon(tester, taskTitle);
  });
}
