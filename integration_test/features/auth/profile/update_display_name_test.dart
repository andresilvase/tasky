import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> updateUserDisplayName(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
  await tester.pumpAndSettle();

  final displayNameInput = find.byKey(const Key(WidgetKeys.changeDisplayNameInput));
  final String displayName = 'John Doe';

  await tester.enterText(displayNameInput, displayName);
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.saveProfileButton)));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key(WidgetKeys.headerDisplayName)), findsOneWidget);
}
