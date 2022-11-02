import 'package:flutter/material.dart';

class TextInputWidgets extends StatelessWidget {
  final TextEditingController controller;
  final String hintTetx;
  final double? heightSize;
  final int? maxLine;
  const TextInputWidgets(
      {super.key,
      required this.controller,
      required this.hintTetx,
      this.maxLine,
      this.heightSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize ?? 55,
      width: double.infinity,
      child: TextFormField(
          autofocus: false,
          obscureText: false,
          controller: controller,
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
              hoverColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              hintText: hintTetx,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white))),
    );
  }
}
