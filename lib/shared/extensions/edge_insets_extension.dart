import 'package:bau_recht/shared/theme/tokens/spacings.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsExtension on EdgeInsets {
  static EdgeInsets padding({
    Spacings? all,
    Spacings? vertical,
    Spacings? horizontal,
    Spacings? left,
    Spacings? top,
    Spacings? right,
    Spacings? bottom,
  }) {
    assert(
      all != null ||
          vertical != null ||
          horizontal != null ||
          left != null ||
          top != null ||
          right != null ||
          bottom != null,
      'At least one padding value must be provided.',
    );
    assert(
      all == null ||
          (vertical == null &&
              horizontal == null &&
              left == null &&
              top == null &&
              right == null &&
              bottom == null),
      'If "all" is provided, no other padding values should be provided.',
    );
    assert(
      vertical == null || (all == null && horizontal == null),
      'If "vertical" is provided, "all" and "horizontal" should not be provided.',
    );
    assert(
      horizontal == null || (all == null && vertical == null),
      'If "horizontal" is provided, "all" and "vertical" should not be provided.',
    );

    if (all != null) {
      return EdgeInsets.all(all.value);
    }

    return EdgeInsets.only(
      left: left?.value ?? horizontal?.value ?? 0,
      top: top?.value ?? vertical?.value ?? 0,
      right: right?.value ?? horizontal?.value ?? 0,
      bottom: bottom?.value ?? vertical?.value ?? 0,
    );
  }
}
