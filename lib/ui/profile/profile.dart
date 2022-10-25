import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/remote/auth_repository.dart';
import 'bloc/profile_bloc.dart';

class ProfileScren extends StatelessWidget {
  const ProfileScren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: ((context) {
        final bloc = ProfileBloc();
        bloc.add(ProfileStarted(AuthRepository.authChangeNotifire.value));
        return bloc;
      }),
      child: Scaffold(
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
            children: [
              Text("data"),
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is ProfileNotEntered) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Pls login or sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (state is ProfileEntered) {
                  return const Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  throw "bad state";
                }
              })
            ],
          )),
    );
  }
}

class _ProfileSettingsItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  const _ProfileSettingsItem({required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(iconData),
          title: Text(title),
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1)
      ],
    );
  }
}
