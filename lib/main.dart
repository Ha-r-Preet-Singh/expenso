import 'package:expenso_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(

      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: SplashScreen(),
  ));
}
