import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taski/main.dart';

import 'use_cases.dart/tasks/complete_task_test.dart';
import 'use_cases.dart/tasks/create_task_when_list_is_empty_test.dart';
import 'use_cases.dart/tasks/create_task_when_list_is_not_empty_test.dart';
import 'use_cases.dart/tasks/search_task_by_description.dart';
import 'use_cases.dart/tasks/search_task_by_title.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test - should be able to', () {
    setUp(() async {
      await init();
    });

    createTaskWhenListIsEmpty();
    createTaskWhenListIsNotEmpty();
    completeTask();
    searchTaskByTitle();
    searchTaskByDescription();
  });
}
