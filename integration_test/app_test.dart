import 'tasks/_main_test.dart' as task_tests;
import 'auth/_main_test.dart' as auth_tests;
import 'language/_main_test.dart' as language_tests;

void main() {
  auth_tests.main();
  task_tests.main();
  language_tests.main();
}
