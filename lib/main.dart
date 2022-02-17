import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'web view',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SafeArea(child: HomeScreen()),
      // home: SafeArea(child: WebViewExample()),
    );
  }
}
