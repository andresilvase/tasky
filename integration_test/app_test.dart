import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:taski/main.dart';

import 'use_cases.dart/tasks/taski_test.dart';
import 'use_cases.dart/auth/auth_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end tests', () {
    setUp(() async {
      await init();
    });

    authTests();
    taskTests();
  });
}
