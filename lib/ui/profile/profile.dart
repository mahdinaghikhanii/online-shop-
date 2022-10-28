import 'package:flutter/material.dart';

import '../../data/repo/remote/auth_repository.dart';

class ProfileScren extends StatelessWidget {
  const ProfileScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            titleSpacing: 20,
            title: Text("Account settings",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontSize: 20))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
                valueListenable: AuthRepository.authChangeNotifire,
                builder: ((context, value, child) {
                  if (value == null || value.token.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Welcome pls login\nOr sign up",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  } else {
                    return Container();
                  }
                })),
            _ProfileSettingsItem(
              iconData: Icons.person,
              title: "Personal information",
              ontap: () {},
            ),
            _ProfileSettingsItem(
              iconData: Icons.notifications,
              title: "Notification",
              ontap: () {},
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Support",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(height: 10),
            _ProfileSettingsItem(
                iconData: Icons.help, title: "Get help", ontap: () {}),
            _ProfileSettingsItem(
                iconData: Icons.feed_outlined,
                title: "Give us feedback",
                ontap: () {})
          ],
        ));
  }
}

class _ProfileSettingsItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback ontap;
  const _ProfileSettingsItem(
      {required this.iconData, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              iconData,
              color: Colors.white,
            ),
            title: Text(title),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(height: 2, endIndent: 16, indent: 16),
      ],
    );
  }
}
