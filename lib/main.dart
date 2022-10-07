import 'package:flutter/material.dart';
import 'package:online_shop/common/http_client.dart';
import 'package:online_shop/data/source/product_data_source.dart';
import 'ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProdcutRemoteDataSource(httpClients).getAllProduct().then((value) {
      debugPrint(value.toString());
    });
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
