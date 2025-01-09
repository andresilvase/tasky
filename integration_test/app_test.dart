import 'features/tasks/_main_test.dart' as task_tests;
import 'features/auth/_main_test.dart' as auth_tests;
import 'features/language/_main_test.dart' as language_tests;

void main() {
  auth_tests.main();
  task_tests.main();
  language_tests.main();
}
