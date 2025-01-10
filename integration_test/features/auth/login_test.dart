import 'package:flutter_test/flutter_test.dart';
import 'common/login_common_flow.dart';
import 'package:tasky/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void login() {
  testWidgets('login', (tester) async {
    await _initApp(tester);

    await loginCommon(tester);
  });
}
