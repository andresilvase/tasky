import 'package:tasky/core/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NullableStringExtension', () {
    test('should return true if value is NOT empty AND NOT null', () async {
      final String value = 'test';

      expect(value.isNotEmptyNeighterNull(), true);
    });

    test('should return false if value is empty', () async {
      final String value = '';

      expect(value.isNotEmptyNeighterNull(), false);
    });

    test('should return false if value is null', () async {
      final String? value = null;

      expect(value.isNotEmptyNeighterNull(), false);
    });
  });

  group('removeAccents', () {
    test('removes lowercase accented characters', () {
      const input = 'áàâãäåçéèêëíìîïñóòôõöúùûüýÿ';
      const expected = 'aaaaaaceeeeiiiinooooouuuuyy';
      final result = input.removeAccents();
      expect(result, expected);
    });

    test('removes uppercase accented characters', () {
      const input = 'ÁÀÂÃÄÅÇÉÈÊËÍÌÎÏÑÓÒÔÕÖÚÙÛÜÝ';
      const expected = 'AAAAAACEEEEIIIINOOOOOUUUUY';
      final result = input.removeAccents();
      expect(result, expected);
    });

    test('handles mixed strings with accented and non-accented characters', () {
      const input = 'Olá, mundo! Árvore com çedo';
      const expected = 'Ola, mundo! Arvore com cedo';
      final result = input.removeAccents();
      expect(result, expected);
    });

    test('returns the same string if no accented characters', () {
      const input = 'Hello World!';
      final result = input.removeAccents();
      expect(result, input);
    });

    test('handles empty strings', () {
      const input = '';
      final result = input.removeAccents();
      expect(result, input);
    });
  });
}
