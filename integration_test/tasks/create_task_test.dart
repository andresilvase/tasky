import 'package:flutter_test/flutter_test.dart';

import 'package:taski/main.dart';

import 'common/create_task_flow.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void createTask({String? title, String? taskDescription}) {
  testWidgets('create a new task', (tester) async {
    await _initApp(tester);

    await createTaskCommon(tester);
  });
}
