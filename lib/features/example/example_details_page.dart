import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ExampleDetailsPage extends StatelessWidget {
  const ExampleDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
