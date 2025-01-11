import 'package:flutter_test/flutter_test.dart';
import '../common/create_account_common_flow.dart';
import 'package:tasky/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void createAnAccount() {
  testWidgets('create an account', (tester) async {
    await _initApp(tester);

    await createAccountCommon(tester);
  });
}
