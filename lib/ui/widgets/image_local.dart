import 'package:flutter/material.dart';

class LocalImageService extends StatelessWidget {
  final String localImageAddres;
  const LocalImageService({super.key, required this.localImageAddres});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          localImageAddres,
          fit: BoxFit.cover,
        ));
  }
}
