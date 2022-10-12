import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/ui/notification/bloc/notification_bloc.dart';
import 'package:online_shop/ui/widgets/image_local.dart';

class NotificationScren extends StatelessWidget {
  const NotificationScren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = NotificationBloc();
        bloc.add(NotificationStarted());
        return bloc;
      },
      child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            titleSpacing: 16,
            elevation: 0,
            title: Text(
              "Notifications",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 80,
                      width: 80,
                      child: LocalImageService(
                        localImageAddres: "assets/img/logo.png",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "womes clothes flash sjsdh shj j",
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text("addidads and puma", maxLines: 2)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(height: 2, endIndent: 16, indent: 16)
            ],
          ),
        );
      })),
    );
  }
}
