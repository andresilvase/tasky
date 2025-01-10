import 'package:flutter_test/flutter_test.dart';
import 'package:tasky/core/constants/widgets_keys.dart';

void main() {
  test('WidgetsKeys should have unique keys', () async {
    final taskId = '123';
    final taskItemButtonKey = WidgetKeys.taskiItemDeleteButton(taskId);

    expect(taskItemButtonKey, 'tasky-item-delete-button-$taskId');
  });
}
