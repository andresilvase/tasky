import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common/logout_common_flow.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void createAnAccount() {
  testWidgets('create an account', (tester) async {
    await _initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.toggleAuthModeButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.usernameInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.usernameInput)), 'testAccount');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.passwordInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.passwordInput)), 'test');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.repeatPasswordInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.repeatPasswordInput)), 'test');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.authSubmitButton)));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(WidgetKeys.welcome)), findsOneWidget);
    await tester.pumpAndSettle();

    await logoutCommon(tester);
  });
}
