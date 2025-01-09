import 'package:taski/core/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('NullableStringExtension should return true if value is NOT empty AND NOT null', () async {
    final String value = 'test';

    expect(value.isNotEmptyNeighterNull(), true);
  });

  test('NullableStringExtension should return false if value is empty', () async {
    final String value = '';

    expect(value.isNotEmptyNeighterNull(), false);
  });

  test('NullableStringExtension should return false if value is null', () async {
    final String? value = null;

    expect(value.isNotEmptyNeighterNull(), false);
  });
}
