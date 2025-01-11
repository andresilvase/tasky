import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> updateUserDisplayName(WidgetTester tester, {bool? saveToStorage}) async {
  final displayNameInput = find.byKey(const Key(WidgetKeys.changeDisplayNameInput));
  final String displayName = 'André silva';

  await tester.enterText(displayNameInput, displayName);
  await tester.pumpAndSettle();

  if (saveToStorage ?? false) {
    await tester.tap(find.byKey(const Key(WidgetKeys.saveProfileButton)));
    await tester.pumpAndSettle();
  } else {
    await tester.tap(find.byKey(const Key(WidgetKeys.headerCloseButton)));
  }

  await tester.pumpAndSettle();

  expect(find.byKey(const Key(WidgetKeys.headerDisplayName)), findsOneWidget);
}
