// test/app_gradients_test.dart
import 'package:bau_recht/shared/theme/extensions/gradient_extension.dart';
import 'package:bau_recht/shared/theme/tokens/color_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppGradients.light()', () {
    test('exposes a LinearGradient with expected alignments, colors, and stops', () {
      final g = AppGradients.light().background;
      expect(g, isA<LinearGradient>());

      final lg = g as LinearGradient;

      // Alignments
      expect(lg.begin, Alignment.topRight);
      expect(lg.end, Alignment.bottomLeft);

      // Colors
      expect(lg.colors.length, 3);
      expect(lg.colors[0], ColorTokens.accentBackground);
      expect(lg.colors[1], ColorTokens.accentBackground);
      expect(lg.colors[2], ColorTokens.warmSand);

      // Stops
      expect(lg.stops, isNotNull);
      expect(lg.stops, orderedEquals(const [0.0, 0.5, 1.0]));

      // Sanity
      expect(lg.tileMode, TileMode.clamp);
      expect(lg.transform, isNull);
    });
  });

  group('AppGradients.dark()', () {
    test('exposes a LinearGradient with expected alignments and colors', () {
      final g = AppGradients.dark().background;
      expect(g, isA<LinearGradient>());

      final lg = g as LinearGradient;

      // Alignments
      expect(lg.begin, Alignment.topLeft);
      expect(lg.end, Alignment.bottomRight);

      // Colors
      expect(
          lg.colors,
          orderedEquals(const [
            Color(0xFF1E2932),
            Color(0xFF2B2723),
          ]));

      // Stops are not provided in dark()
      expect(lg.stops, isNull);

      // Sanity
      expect(lg.tileMode, TileMode.clamp);
      expect(lg.transform, isNull);
    });
  });

  group('copyWith', () {
    test('replaces background and leaves original untouched', () {
      final original = AppGradients.light();
      const replacement = LinearGradient(
        colors: [Colors.red, Colors.blue],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

      final copy = original.copyWith(background: replacement);

      // New instance has the replacement background
      _expectLinearGradientEquals(copy.background as LinearGradient, replacement);

      // Original remains the same
      _expectLinearGradientEquals(
        original.background as LinearGradient,
        AppGradients.light().background as LinearGradient,
      );
    });
  });
}

/// ===== Helpers =====

void _expectLinearGradientEquals(LinearGradient actual, LinearGradient expected) {
  expect(actual.begin, expected.begin, reason: 'begin mismatch');
  expect(actual.end, expected.end, reason: 'end mismatch');
  expect(actual.tileMode, expected.tileMode, reason: 'tileMode mismatch');

  // Colors
  expect(actual.colors.length, expected.colors.length, reason: 'colors length mismatch');
  for (var i = 0; i < expected.colors.length; i++) {
    expect(actual.colors[i], expected.colors[i], reason: 'color[$i] mismatch');
  }

  // Stops: both null or equal lists
  if (expected.stops == null) {
    expect(actual.stops, isNull, reason: 'expected null stops');
  } else {
    expect(actual.stops, isNotNull, reason: 'stops should not be null');
    expect(actual.stops, orderedEquals(expected.stops!), reason: 'stops mismatch');
  }

  // Transform: both null by default in your code
  expect(actual.transform, expected.transform, reason: 'transform mismatch');
}
