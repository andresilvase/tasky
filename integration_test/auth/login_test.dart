import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void login() {
  testWidgets('login', (tester) async {
    await _initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.usernameInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.usernameInput)), 'testAccount');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.passwordInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.passwordInput)), 'test');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.authSubmitButton)));
    await tester.pumpAndSettle();
  });
}
