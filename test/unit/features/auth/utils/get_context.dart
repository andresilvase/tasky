import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../widgets/common/app_wrapper.dart';

Future<BuildContext> getTestContext(WidgetTester tester) async {
  late BuildContext testContext;

  await tester.pumpWidget(
    AppWrapper(
      child: Builder(
        builder: (context) {
          testContext = context;
          return Container();
        },
      ),
    ),
  );
  await tester.pumpAndSettle();

  return testContext;
}
