import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:online_shop/data/entity/product_entity.dart';

import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'ui/root.dart';

import 'theme.dart';

const producBoxName = "product_cart_box";

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(RatingEntityAdapter());
  await Hive.openBox<ProductEntity>(producBoxName);
  await authRepository.loadInfo();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
          dividerColor: Colors.grey,
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
              secondary: LightThemeColors.secondaryColor,
              primary: LightThemeColors.primariColor,
              onPrimary: LightThemeColors.scafoldBackgroundColro)),
      home: const RootScrean(),
    );
  }
}
