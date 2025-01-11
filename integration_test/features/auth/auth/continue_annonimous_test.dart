import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../common/init_app.dart';

void continueAnnonimous() {
  testWidgets('continue annonimous', (tester) async {
    await initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.continueAnnonymousButton)));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(WidgetKeys.welcome)), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
