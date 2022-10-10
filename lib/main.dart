import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/root.dart';

import 'theme.dart';

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
          appBarTheme: const AppBarTheme(
            backgroundColor: LightThemeColors.scafoldBackgroundColro,
          ),
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
              onPrimary: LightThemeColors.scafoldBackgroundColro)),
      home: const RootScrean(),
    );
  }
}
