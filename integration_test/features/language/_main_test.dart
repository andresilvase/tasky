import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'change_language_test.dart';
import 'package:tasky/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('switch language tests should', () {
    setUp(() async {
      await init();
    });

    changeLanguage();
  });
}
