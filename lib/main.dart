import 'package:flutter/material.dart';
import 'package:poc/Auth/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return ResponsiveLayout(
              mobileWidget: MobileLayout(),
              webWidget: WebLayout(),
            );
          },
        ),
      ),
    );
  }
}
