import 'package:flutter/material.dart';
import 'package:recipe_finder/services/shared_service.dart';

import 'core/injection/inj.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitializeDependencies().init();
  await Prefs.init();
  runApp(const MyApp());
}
