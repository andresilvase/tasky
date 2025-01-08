import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void logout() {
  testWidgets('logout', (tester) async {
    await _initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuLogoutButton)));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(WidgetKeys.welcome)), findsNothing);
    expect(find.byKey(const Key(WidgetKeys.authSubmitButton)), findsOneWidget);
  });
}
