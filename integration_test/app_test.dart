import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasky/main.dart';

import 'features/language/language_test.dart' as language_tests;
import 'features/tasks/tasks_test.dart' as task_tests;
import 'features/auth/auth_test.dart' as auth_tests;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await init();
  });

  auth_tests.main();
  language_tests.main();
  task_tests.main();
}
