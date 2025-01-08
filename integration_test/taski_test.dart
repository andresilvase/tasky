import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taski/main.dart';

import 'use_cases.dart/unlogged/create_task_when_list_is_empty_test.dart';
import 'use_cases.dart/unlogged/create_task_when_list_is_not_empty_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test - unlogged in should be able to', () {
    setUp(() async {
      await init();
    });

    createTaskWhenListIsEmptyUnlogged();
    createTaskWhenListIsNotEmptyUnlogged();

    testWidgets('create a new task if the list is NOT empty', (tester) async {});
  });
}
