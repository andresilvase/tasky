import 'unit/features/language/repository/language_repository_test.dart' as language_repository_test;
import 'unit/features/language/viewModel/language_view_model_test.dart' as language_view_model_test;
import 'unit/features/language/model/locale_model_test.dart' as language_model_test;
import 'unit/core/utils/functions_test.dart' as function_utils_test;
import 'unit/core/db/hive/hive_test.dart' as hive_test;

void main() {
  hive_test.main();

  function_utils_test.main();

  language_model_test.main();
  language_repository_test.main();
  language_view_model_test.main();
}
