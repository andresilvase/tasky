import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> loginCommon(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.usernameInput)));
  await tester.pumpAndSettle();

  await tester.enterText(find.byKey(const Key(WidgetKeys.usernameInput)), 'andresilvase');
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.passwordInput)));
  await tester.pumpAndSettle();

  await tester.enterText(find.byKey(const Key(WidgetKeys.passwordInput)), 'test');
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.authSubmitButton)));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key(WidgetKeys.welcome)), findsOneWidget);
  await tester.pumpAndSettle();
}
