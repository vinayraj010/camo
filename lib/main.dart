import 'package:camorent/features/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash to Login Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
