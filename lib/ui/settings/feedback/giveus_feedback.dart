import 'package:flutter/material.dart';

class GiveUsFeedBack extends StatelessWidget {
  const GiveUsFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          titleSpacing: 20,
          title: Text("Give us feedback",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 20))),
      body: Column(
        children: [],
      ),
    );
  }
}
