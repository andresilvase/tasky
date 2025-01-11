import 'unit/features/language/repository/language_repository_test.dart' as language_repository_test;
import 'unit/features/language/viewModel/language_view_model_test.dart' as language_view_model_test;
import 'unit/features/language/model/locale_model_test.dart' as language_model_test;
import 'unit/core/utils/functions_test.dart' as function_utils_test;
import 'unit/core/db/hive/hive_test.dart' as hive_test;
import 'unit/core/constants/extensions_test.dart' as extensions_test;
import 'unit/core/constants/widgets_keys_test.dart' as widgets_keys_test;
import 'unit/core/utils/asset_picker_test.dart' as asset_picker_test;
import 'unit/core/utils/functions_test.dart' as functions_test;
import 'unit/core/utils/device_permission_test.dart' as storage_permission_test;
import 'unit/features/auth/repository/auth_repository_test.dart' as auth_repository_test;
import 'unit/features/auth/viewModel/auth_view_model_test.dart' as auth_view_model_test;
import 'unit/features/auth/model/auth_result_test.dart' as auth_result_test;
import 'unit/features/auth/model/user_test.dart' as auth_user_test;

void main() {
  hive_test.main();

  function_utils_test.main();
  extensions_test.main();
  widgets_keys_test.main();
  asset_picker_test.main();
  functions_test.main();
  storage_permission_test.main();

  auth_repository_test.main();
  auth_view_model_test.main();
  auth_result_test.main();
  auth_user_test.main();

  language_model_test.main();
  language_repository_test.main();
  language_view_model_test.main();
}
