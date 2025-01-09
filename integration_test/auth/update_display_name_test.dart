import 'package:taski/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:taski/main.dart';

Future<void> _initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void updateUserDisplayName() {
  testWidgets('update user display name', (WidgetTester tester) async {
    await _initApp(tester);

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
  });
}
