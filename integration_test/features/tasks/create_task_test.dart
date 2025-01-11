import 'package:flutter_test/flutter_test.dart';

import 'common/create_task_flow.dart';

import '../common/init_app.dart';

void createTask({String? title, String? taskDescription}) {
  testWidgets('create a new task', (tester) async {
    await initApp(tester);

    await createTaskCommon(tester);
  });
}
