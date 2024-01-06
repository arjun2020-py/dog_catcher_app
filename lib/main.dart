import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/auth/splash/view/screen_splash.dart';
import 'utils/custom_router/custom_router.dart';
import 'utils/interlization/interlization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Interlization(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenSplash(),
      routes:dogCatcherMainRouter ,
    );
  }
}
