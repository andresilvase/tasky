import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../common/init_app.dart';

void tryCreateAccountWithInvalidInputs() {
  testWidgets('try create an account with invalid inputs', (tester) async {
    await initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.usernameInput)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key(WidgetKeys.usernameInput)), 'PontuacáoAcentós');
    await tester.pumpAndSettle();
  });
}
