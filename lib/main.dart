import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/presentation_utils/app_theme_data.dart';
import 'presentation/splash/splash_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // set orientation to portrait
  runApp(const ProviderScope(child: MyApp())); // run the MyApp widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(), // get app theme
      home: const SplashScreen(), // set home to SplashScreen
      debugShowCheckedModeBanner: false, // hide debug banner
    );
  }
}
