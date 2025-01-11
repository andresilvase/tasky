import 'features/language/language_test.dart' as language_tests;
import 'features/tasks/tasks_test.dart' as task_tests;
import 'features/auth/auth_test.dart' as auth_tests;

void main() {
  auth_tests.main();
  language_tests.main();
  task_tests.main();
}
