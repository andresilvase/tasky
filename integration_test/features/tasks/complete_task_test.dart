import 'package:flutter_test/flutter_test.dart';
import 'common/complete_task_flow.dart';
import 'common/create_task_flow.dart';

import '../common/init_app.dart';

void completeTask({String? title}) {
  testWidgets('complete task', (tester) async {
    await initApp(tester);

    final String taskTitle = title ?? 'Estudar Inglês';

    await createTaskCommon(tester, title: taskTitle);
    await completeTaskCommon(tester, taskTitle);
  });
}
