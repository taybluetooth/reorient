import 'package:flutter/material.dart';
import 'package:reorient/pages/onboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reorient',
      home: OnboardPage(),
    );
  }
}
