import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> logoutCommon(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.menuLogoutButton)));
  await tester.pumpAndSettle();

  expect(find.byKey(const Key(WidgetKeys.welcome)), findsNothing);
  expect(find.byKey(const Key(WidgetKeys.authSubmitButton)), findsOneWidget);
}
