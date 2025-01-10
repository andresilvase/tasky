import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'continue_annonimous_test.dart';
import 'create_an_account_test.dart';
import 'try_create_invalid_account.dart';
import 'update_display_name_test.dart';
import 'package:taski/main.dart';
import 'login_test.dart';
import 'logout_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('authentication tests should', () {
    setUp(() async {
      await init();
    });

    createAnAccount();
    login();
    updateUserDisplayName();
    logout();
    tryCreateAccountWithInvalidInputs();
    continueAnnonimous();
  });
}
