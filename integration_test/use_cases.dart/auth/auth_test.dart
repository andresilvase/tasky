import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:taski/main.dart';

import 'create_an_account_test.dart';
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
    logout();
  });
}
