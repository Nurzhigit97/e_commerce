import 'package:flutter/material.dart';
import 'package:e_commerce/app.dart';
import 'package:e_commerce/shared/core/utils/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();
  runApp(const App());
}
