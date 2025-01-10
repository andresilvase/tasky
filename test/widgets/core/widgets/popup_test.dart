import 'package:flutter/material.dart';
import 'package:tasky/core/constants/widgets_keys.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:tasky/core/widgets/popup.dart';

import '../../common/app_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PopUpMessage', () {
    testWidgets('should present confirmAction button when an action is passed', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: PopUpMessage(confirmAction: () {})));
      expect(find.byKey(Key(WidgetKeys.popUpMessageConfirm)), findsOneWidget);
    });
    testWidgets('should present denyAction button when an action is passed', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: PopUpMessage(denyAction: () {})));
      expect(find.byKey(Key(WidgetKeys.popUpMessageDeny)), findsOneWidget);
    });

    testWidgets('should not present confirmAction button when an action is not passed', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: const PopUpMessage()));
      expect(find.byKey(Key(WidgetKeys.popUpMessageConfirm)), findsNothing);
    });

    testWidgets('should not present denyAction button when an action is passed', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: PopUpMessage(denyAction: () {})));
      expect(find.byKey(Key(WidgetKeys.popUpMessageConfirm)), findsNothing);
    });
  });
}
