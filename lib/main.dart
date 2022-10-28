import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/adapters.dart';
import 'data/entity/product_entity.dart';
import 'data/repo/remote/auth_repository.dart';
import 'data/source/remote/cloud_messaging_data_source.dart';
import 'firebase_options.dart';
import 'ui/root.dart';

import 'theme.dart';

const producBoxName = "product_cart_box";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(RatingEntityAdapter());
  await Hive.openBox<ProductEntity>(producBoxName);
  await authRepository.loadInfo();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandlers);
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
              onPrimary: LightThemeColors.primaryTextColor)),
      home: const RootScrean(),
    );
  }
}
