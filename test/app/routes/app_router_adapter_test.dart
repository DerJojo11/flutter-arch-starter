import 'package:flutter_arch_starter/app/routes/app_router.gr.dart';
import 'package:flutter_arch_starter/app/routes/app_router_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../src/mocks/mocks.dart';

void main() {
  late AppRouterAdapter appRouterAdapter;
  late MockAppRouter mockAppRouter;

  setUp(() {
    mockAppRouter = MockAppRouter();
    appRouterAdapter = AppRouterAdapter(mockAppRouter);
  });

  test('verify AppRouter.push gets called with correct parameter', () async {
    const ExampleRoute exampleRoute = ExampleRoute();
    when(() => mockAppRouter.push(exampleRoute)).thenAnswer((_) async => null);

    appRouterAdapter.push(exampleRoute);

    verify(() => mockAppRouter.push(exampleRoute)).called(1);
  });
  test('verify AppRouter.replace gets called with correct parameter', () async {
    const ExampleRoute exampleRoute = ExampleRoute();
    when(() => mockAppRouter.replace(exampleRoute)).thenAnswer((_) async => null);

    appRouterAdapter.replace(exampleRoute);

    verify(() => mockAppRouter.replace(exampleRoute)).called(1);
  });

  test('verify AppRouter.maybePop gets called with correct parameter', () async {
    when(() => mockAppRouter.maybePop()).thenAnswer((_) async => true);

    appRouterAdapter.maybePop();

    verify(() => mockAppRouter.maybePop()).called(1);
  });

  test('verify hand over wrong parameter type will throw AssertionError', () async {
    when(() => mockAppRouter.maybePop()).thenAnswer((_) async => true);

    expect(
      () => appRouterAdapter.push('Invalid Route Type'),
      throwsA(isA<AssertionError>()),
    );
  });
}
