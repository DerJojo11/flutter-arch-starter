import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/app/routes/app_router.gr.dart';
import 'package:flutter_arch_starter/shared/index.dart';

@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.helloWorld)),
      body: Center(child: Text(context.l10n.helloWorld)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.appRouter.push(ExampleDetailsRoute(id: '42')),
        child: const Icon(Icons.add),
      ),
    );
  }
}
