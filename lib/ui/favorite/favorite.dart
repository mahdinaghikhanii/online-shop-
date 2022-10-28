import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/ui/favorite/bloc/favorite_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';
import 'package:online_shop/ui/widgets/image_local.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

import '../../data/repo/local/favorite_product_local_repository.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        final bloc = FavoriteBloc(favoriteproductLocalRepository);
        bloc.add(FavoriteStarted());
        return bloc;
      }),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            titleSpacing: 20,
            title: Text("Wishlist",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontSize: 20))),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: ((context, state) {
          if (state is FavoriteLoading) {
            return const LoadingState();
          } else if (state is FavoriteFailed) {
            return EmptyState(
                image: const LocalImageService(
                    localImageAddres: "assets/svg/no_data.svg",
                    imageSvgOrAnutherVersion: true),
                text: "We have Problems",
                buttonClicked: Container());
          } else if (state is FavoriteSuccess) {
            return Container();
          } else {
            throw "Bad state";
          }
        })),
      ),
    );
  }
}
