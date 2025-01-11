import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> updateUserDisplayName(WidgetTester tester) async {
  final displayNameInput = find.byKey(const Key(WidgetKeys.changeDisplayNameInput));
  final String displayName = 'André silva';

  await tester.enterText(displayNameInput, displayName);
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.headerCloseButton)));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key(WidgetKeys.headerDisplayName)), findsOneWidget);
}
