import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/app/index.dart';
import 'package:flutter_arch_starter/l10n/generated/app_localizations.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../src/mocks/mocks.dart';

void main() {
  setUp(
    () {
      final MockAppRouter mockAppRouter = MockAppRouter();
      when(() => mockAppRouter.config()).thenReturn(AppRouter().config());

      getIt.registerSingleton<AppRouter>(mockAppRouter);
    },
  );

  testWidgets('expect App wires delegates/locales', (tester) async {
    await tester.pumpWidget(const App());
    final app = tester.widget<MaterialApp>(find.byType(MaterialApp).first);
    expect(app.localizationsDelegates, isNotNull);
    expect(AppLocalizations.supportedLocales, contains(const Locale('de')));
  });

  testWidgets('expect to find AppTheme to handle theme changes', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(AppTheme), findsOneWidget);
  });
}
