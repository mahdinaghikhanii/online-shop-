import 'package:flutter/material.dart';

class LargeTitle extends StatelessWidget {
  final String firstTitle;
  final String secoundTitle;
  final Widget item;
  const LargeTitle(
      {super.key,
      required this.firstTitle,
      required this.secoundTitle,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstTitle, style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Text(secoundTitle),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios,
                    size: 12, color: Colors.white)
              ],
            )
          ],
        ),
      ),
      item
    ]);
  }
}
