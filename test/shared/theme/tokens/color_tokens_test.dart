import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('expect to return correct color for blue', () {
    expect(ColorTokens.blue, const Color(0xFF2F4C7A));
  });
  test('expect to return correct color for warmSand', () {
    expect(ColorTokens.warmSand, const Color(0xFFF6EAD8));
  });
  test('expect to return correct color for accentBackground', () {
    expect(ColorTokens.accentBackground, const Color(0xFFE7F0F2));
  });
}
