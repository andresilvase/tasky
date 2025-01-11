import 'package:flutter_test/flutter_test.dart';
import 'package:tasky/main.dart';

Future<void> initApp(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}
