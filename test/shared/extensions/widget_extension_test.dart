import 'package:bau_recht/shared/extensions/widget_extension.dart';
import 'package:bau_recht/shared/theme/tokens/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../src/extensions/widget_tester_extension.dart';

void main() {
  testWidgets('expect to find a $Padding around the widget', (tester) async {
    final Widget widget = Container(
      key: const ValueKey('example'),
    );

    await tester.pumpApp(widget.withPadding(all: Spacings.medium));

    final Finder finder = find.ancestor(
        of: find.byWidget(widget), matching: find.byType(Padding));

    expect(finder, findsOneWidget);
  });
}
