import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/app/routes/app_router.gr.dart';
import 'package:flutter_arch_starter/features/example/example_page.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../src/extensions/widget_tester_extension.dart';
import '../../src/mocks/mocks.dart';

void main() {
  testWidgets('expect to find "Hello World!" text', (tester) async {
    await tester.pumpApp(const ExamplePage());

    expect(find.text('Hello World!'), findsOneWidget);
  });
  testWidgets('expect to find $Placeholder as body', (tester) async {
    await tester.pumpApp(const ExamplePage());

    expect(find.byType(Placeholder), findsOneWidget);
  });
  testWidgets('expect to find $FloatingActionButton to push to next Page', (tester) async {
    await tester.pumpApp(const ExamplePage());

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('verify tap on $FloatingActionButton will push to $ExampleDetailsRoute', (tester) async {
    final MockAppRouterAdapter mockAppRouter = MockAppRouterAdapter();
    final ExampleDetailsRoute expectedRoute = ExampleDetailsRoute(id: '42');
    when(() => mockAppRouter.push(expectedRoute)).thenAnswer((_) async {
      return null;
    });
    getIt.registerSingleton<IRouter>(mockAppRouter);

    await tester.pumpApp(const ExamplePage());
    await tester.tap(find.byType(FloatingActionButton));

    verify(() => mockAppRouter.push(expectedRoute)).called(1);
  });
}
