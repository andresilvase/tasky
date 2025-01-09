import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> openLanguageSettings(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.menuLanguageSettingsButton)));
  await tester.pumpAndSettle();
}
