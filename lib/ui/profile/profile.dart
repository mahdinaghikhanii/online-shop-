import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'package:online_shop/ui/profile/bloc/profile_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';
import 'package:online_shop/ui/widgets/image_local.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

import '../auth/auth.dart';

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
                    .copyWith(color: Colors.white, fontSize: 22))),
        body: BlocProvider<ProfileBloc>(
          create: ((context) {
            final bloc = ProfileBloc();
            bloc.add(ProfileStarted(AuthRepository.authChangeNotifire.value));
            return bloc;
          }),
          child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: ((context, state) {
            if (state is ProfileNotEntered) {
              return EmptyState(
                  image: const Center(
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: LocalImageService(
                        localImageAddres: "assets/svg/auth.svg",
                        imageSvgOrAnutherVersion: true,
                      ),
                    ),
                  ),
                  text: "Please create account or login",
                  buttonClicked: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondary)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: ((context) => AuthScrean())));
                    },
                    child: Text(
                      "login or signUp",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white.withOpacity(0.4)),
                    ),
                  ));
            } else if (state is ProfileLoading) {
              return const LoadingState();
            } else if (state is ProfileSuccess) {
              return Container();
            } else {
              throw "We  have problems";
            }
          })),
        ));
  }
}
