import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final Widget image;
  final String text;
  final Widget buttonClicked;
  const EmptyState(
      {super.key,
      required this.image,
      required this.text,
      required this.buttonClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image,
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 10),
        buttonClicked
      ],
    );
  }
}
