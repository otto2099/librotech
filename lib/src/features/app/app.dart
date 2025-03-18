import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:librotech/src/core/routes/app_pages.dart';
import 'package:librotech/src/features/app/pages/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Librotech',
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: false,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.deepOrange,
        ),
      ),
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'EN'),
      ],
      initialRoute: HomeScreen.routeName,
      getPages: AppPages.pages,
    );
  }
}
