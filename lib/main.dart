import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core.dart' as di;
import 'presentation/presentation_utils/app_theme_data.dart';
import 'presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // set orientation to portrait
  await di.init();
  runApp(const ProviderScope(child: AarogyaTechApp())); // run the MyApp widget
}

class AarogyaTechApp extends StatelessWidget {
  const AarogyaTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(), // get app theme
      home: const SplashScreen(), // set home to SplashScreen
      debugShowCheckedModeBanner: false, // hide debug banner
    );
  }
}
