import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

import 'ui/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          scaffoldBackgroundColor: LightThemeColors.scafoldBackgroundColro,
          textTheme: GoogleFonts.poppinsTextTheme(
            const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: LightThemeColors.titleTextColor),
                titleMedium: TextStyle(color: Colors.white)),
          ),
          colorScheme: const ColorScheme.light(
            primary: LightThemeColors.primariColor,
          )),
      home: const HomeScrean(),
    );
  }
}
