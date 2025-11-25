import 'package:flutter/widgets.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('padding()', () {
    test('expect throws AssertionError if no values are passed at all.', () {
      expect(
        () => EdgeInsetsExtension.padding(),
        throwsA(isA<AssertionError>()),
      );
    });

    test('expect throws AssertionError if “all” is used together with other values.', () {
      expect(
        () => EdgeInsetsExtension.padding(all: Spacings.small, left: Spacings.small),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => EdgeInsetsExtension.padding(all: Spacings.small, horizontal: Spacings.small),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => EdgeInsetsExtension.padding(all: Spacings.small, vertical: Spacings.small),
        throwsA(isA<AssertionError>()),
      );
    });

    test('expect throws AssertionError if “vertical” is used together with ‘all’ or “horizontal”.', () {
      expect(
        () => EdgeInsetsExtension.padding(vertical: Spacings.small, all: Spacings.medium),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => EdgeInsetsExtension.padding(vertical: Spacings.small, horizontal: Spacings.medium),
        throwsA(isA<AssertionError>()),
      );
    });

    test('expect Throws AssertionError if “horizontal” is used together with ‘all’ or "vertical".', () {
      expect(
        () => EdgeInsetsExtension.padding(horizontal: Spacings.small, all: Spacings.medium),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => EdgeInsetsExtension.padding(horizontal: Spacings.small, vertical: Spacings.medium),
        throwsA(isA<AssertionError>()),
      );
    });

    test('expect “all” sets the same value everywhere', () {
      const Spacings s = Spacings.medium;
      final EdgeInsets p = EdgeInsetsExtension.padding(all: s);
      expect(p, EdgeInsets.all(s.value));
      expect(p.left, s.value);
      expect(p.top, s.value);
      expect(p.right, s.value);
      expect(p.bottom, s.value);
    });

    test('expect only “horizontal” sets left/right, top/bottom remain 0', () {
      const Spacings h = Spacings.small;
      final EdgeInsets p = EdgeInsetsExtension.padding(horizontal: h);
      expect(p.left, h.value);
      expect(p.right, h.value);
      expect(p.top, 0);
      expect(p.bottom, 0);
      expect(p, EdgeInsets.only(left: h.value, right: h.value));
    });

    test('expect only “vertical” sets top/bottom, left/right remain 0', () {
      const Spacings v = Spacings.large;
      final EdgeInsets p = EdgeInsetsExtension.padding(vertical: v);
      expect(p.top, v.value);
      expect(p.bottom, v.value);
      expect(p.left, 0);
      expect(p.right, 0);
      expect(p, EdgeInsets.only(top: v.value, bottom: v.value));
    });

    test('expect individual values are set correctly, remainder remains 0', () {
      const Spacings l = Spacings.extraSmall;
      const Spacings t = Spacings.small;
      const Spacings r = Spacings.medium;
      const Spacings b = Spacings.large;

      final EdgeInsets p = EdgeInsetsExtension.padding(left: l, top: t, right: r, bottom: b);

      expect(
          p,
          EdgeInsets.only(
            left: l.value,
            top: t.value,
            right: r.value,
            bottom: b.value,
          ));
    });

    test('expect individual value overrides group value: left overrides horizontal', () {
      const Spacings h = Spacings.medium;
      const Spacings l = Spacings.small;

      final EdgeInsets p = EdgeInsetsExtension.padding(horizontal: h, left: l);
      expect(p.left, l.value); // override greift
      expect(p.right, h.value); // von horizontal
      expect(p.top, 0);
      expect(p.bottom, 0);
    });

    test('expect individual value overrides group value: top overrides vertical', () {
      const Spacings v = Spacings.medium;
      const Spacings t = Spacings.large;

      final EdgeInsets p = EdgeInsetsExtension.padding(vertical: v, top: t);
      expect(p.top, t.value); // override greift
      expect(p.bottom, v.value); // von vertical
      expect(p.left, 0);
      expect(p.right, 0);
    });

    test('expect Zero fallbacks: pages that are not set fall back to 0', () {
      final EdgeInsets p = EdgeInsetsExtension.padding(left: Spacings.small);
      expect(p.left, Spacings.small.value);
      expect(p.top, 0);
      expect(p.right, 0);
      expect(p.bottom, 0);
    });
  });
}
