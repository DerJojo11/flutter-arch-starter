import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bau_recht/shared/extensions/build_context_extension.dart';
@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.exampleTitle)),
      body: Center(child: Text(context.l10n.hello)),
    );
  }
}