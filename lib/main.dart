import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/app/app.dart';
import 'package:flutter_arch_starter/app/injectable/injectable.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
