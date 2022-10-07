import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop/theme.dart';

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
          textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
              titleLarge: TextStyle(fontWeight: FontWeight.bold))),
          colorScheme: const ColorScheme.light(
            primary: LightThemeColors.primariColor,
          )),
      home: const HomeScrean(),
    );
  }
}
