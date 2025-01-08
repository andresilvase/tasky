import 'package:flutter_test/flutter_test.dart';
import 'package:taski/main.dart';

Future<void> initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void login() {
  testWidgets('create an account', (tester) async {
    await initApp(tester);
  });
}
