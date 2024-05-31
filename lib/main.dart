import 'package:flutter/material.dart';
import 'package:medical_prescription/injection_container.dart';
import 'package:medical_prescription/presentation/app.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}