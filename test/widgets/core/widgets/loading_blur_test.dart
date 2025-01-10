import 'package:flutter/material.dart';
import 'package:tasky/core/widgets/loading_blur.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../common/app_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LoadingBlur', () {
    testWidgets('should render ClipRRect', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: const LoadingBlur()));
      expect(find.byType(ClipRRect), findsOneWidget);
    });
  });
}
