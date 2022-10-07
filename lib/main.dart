import 'package:flutter/material.dart';
import 'ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onlin shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScrean(),
    );
  }
}
