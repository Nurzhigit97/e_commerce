import 'package:flutter/material.dart';
import 'package:e_commerce/app.dart';
import 'package:e_commerce/shared/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator().init();
  runApp(const App());
}
