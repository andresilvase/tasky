import 'package:taski/features/tasks/widgets/tasky_item.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:taski/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test - unlogged in should be able to', () {
    setUp(() async {
      await init();
    });

    testWidgets('create a new task if the list is empty', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final createTaskButton = find.byKey(const Key(WidgetsKeys.createTaskButton));
      expect(createTaskButton, findsOneWidget);

      await tester.tap(createTaskButton);
      await tester.pumpAndSettle();

      final titleField = find.byKey(const Key(WidgetsKeys.createTaskTitleInput));
      expect(titleField, findsOneWidget);

      await tester.enterText(titleField, 'Test Task');
      await tester.pumpAndSettle();

      final descriptionField = find.byKey(const Key(WidgetsKeys.createTaskDescriptionInput));
      expect(descriptionField, findsOneWidget);

      await tester.enterText(descriptionField, 'Test Description');
      await tester.pumpAndSettle();

      final createTaskSubmitButton = find.byKey(const Key(WidgetsKeys.createTaskSubmitButton));
      expect(createTaskSubmitButton, findsOneWidget);

      await tester.tap(createTaskSubmitButton);
      await tester.pumpAndSettle();

      final taskCard = find.byType(TaskiItem);
      expect(taskCard, findsOneWidget);
    });

    testWidgets('create a new task if the list is NOT empty', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final createTaskButton = find.byKey(const Key(WidgetsKeys.navBarAddIcon));
      expect(createTaskButton, findsOneWidget);

      await tester.tap(createTaskButton);
      await tester.pumpAndSettle();

      final titleField = find.byKey(const Key(WidgetsKeys.createTaskTitleInput));
      expect(titleField, findsOneWidget);

      final taskTitle = 'Test Task 2';

      await tester.enterText(titleField, taskTitle);
      await tester.pumpAndSettle();

      final descriptionField = find.byKey(const Key(WidgetsKeys.createTaskDescriptionInput));
      expect(descriptionField, findsOneWidget);

      final createTaskSubmitButton = find.byKey(const Key(WidgetsKeys.createTaskSubmitButton));
      expect(createTaskSubmitButton, findsOneWidget);

      await tester.tap(createTaskSubmitButton);
      await tester.pumpAndSettle();

      final taskCard = find.text(taskTitle);
      expect(taskCard, findsOneWidget);
    });
  });
}
