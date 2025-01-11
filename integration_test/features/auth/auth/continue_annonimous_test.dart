import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tasky/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void continueAnnonimous() {
  testWidgets('continue annonimous', (tester) async {
    await _initApp(tester);

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
