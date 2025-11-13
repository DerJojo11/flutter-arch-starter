// test/spacings_test.dart
import 'package:bau_recht/shared/theme/tokens/spacings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Spacings', () {
    final cases = <({Spacings spacing, String name, double value})>[
      (spacing: Spacings.extraSmall, name: 'extraSmall', value: 4.0),
      (spacing: Spacings.small, name: 'small', value: 8.0),
      (spacing: Spacings.medium, name: 'medium', value: 16.0),
      (spacing: Spacings.large, name: 'large', value: 24.0),
      (spacing: Spacings.extraLarge, name: 'extraLarge', value: 32.0),
    ];

    test('expect all Spacings have exact numeric values', () {
      for (final c in cases) {
        expect(c.spacing.value, equals(c.value), reason: c.name);
      }
    });

    test('expect no duplicate numeric values', () {
      final set = <double>{};
      for (final c in cases) {
        set.add(c.value);
      }
      expect(set.length, equals(cases.length));
    });
  });
}
