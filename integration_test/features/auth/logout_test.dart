import 'package:flutter_test/flutter_test.dart';
import 'common/logout_common_flow.dart';
import 'package:tasky/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void logout() {
  testWidgets('logout', (tester) async {
    await _initApp(tester);

    await logoutCommon(tester);
  });
}
