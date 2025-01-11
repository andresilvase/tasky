import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'try_create_invalid_account.dart';
import 'continue_annonimous_test.dart';
import 'create_an_account_test.dart';
import 'package:tasky/main.dart';
import 'login_test.dart';
import 'logout_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await init();
  });

  group('authentication tests should', () {
    continueAnnonimous();
    tryCreateAccountWithInvalidInputs();
    createAnAccount();
    login();
    logout();
  });
}
