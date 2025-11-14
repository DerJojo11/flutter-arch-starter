import 'package:flutter/widgets.dart';
import 'package:flutter_arch_starter/shared/index.dart';

extension WidgetExtension on Widget {
  /// Wraps the widget with padding using the given [value].
  Widget withPadding({
    Spacings? all,
    Spacings? vertical,
    Spacings? horizontal,
    Spacings? left,
    Spacings? top,
    Spacings? right,
    Spacings? bottom,
  }) {
    return Padding(
      padding: EdgeInsetsExtension.padding(
        all: all,
        vertical: vertical,
        horizontal: horizontal,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}
