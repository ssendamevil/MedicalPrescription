import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/app.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final mapkitApiKey = String.fromEnvironment('MAPKIT_API_KEY');

  await init.initMapkit(
      apiKey: mapkitApiKey
  );

  runApp(const App());
}