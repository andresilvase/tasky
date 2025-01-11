import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

Future<void> updatePhotoProfile(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.changePhoto)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.pickAssetFromGalery)));
  await tester.pumpAndSettle();
}
