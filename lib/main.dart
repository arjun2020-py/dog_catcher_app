import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/auth/splash/view/screen_splash.dart';
import 'utils/custom_router/custom_router.dart';
import 'utils/interlization/interlization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //for web firebase app
  // if (kIsWeb) {
  //   await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyBaQUZlX3me2z1-qZlJQTq64VNS29FNE60", appId: "1:792564589917:web:9d1589524ab0a7d68434b4", messagingSenderId:  "792564589917", projectId: "dog-catcher-app-1bbbc"));
  // }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Interlization(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenSplash(),
      routes: dogCatcherMainRouter,
    );
  }
}
