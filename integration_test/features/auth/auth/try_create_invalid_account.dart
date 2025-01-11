import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tasky/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void tryCreateAccountWithInvalidInputs() {
  testWidgets('try create an account with invalid inputs', (tester) async {
    await _initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.toggleAuthModeButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.usernameInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.usernameInput)), 'PontuacáoAcentós');
    await tester.pumpAndSettle();
  });
}
