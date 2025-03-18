import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:librotech/injection_container.dart';
import 'package:librotech/src/features/app/app.dart';
import 'injection_container.dart' as di;
import 'src/core/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  sl.registerLazySingleton(() => Env(EnvMode.dev));
  await dotenv.load(fileName: Env.fileName);

  runApp(const App());
}
