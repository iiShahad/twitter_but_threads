import 'package:flutter/material.dart';
import 'package:twitter_but_threads/theme/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter but threads',
      theme: Pallete.theme,
      home: const SizedBox(),
    );
  }
}
