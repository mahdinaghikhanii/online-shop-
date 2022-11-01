import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/utils.dart';
import 'package:online_shop/ui/favorite/bloc/favorite_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';
import 'package:online_shop/ui/widgets/image_local.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

import '../../data/entity/product_entity.dart';
import '../../data/repo/local/favorite_product_local_repository.dart';
import '../widgets/image_remote.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          titleSpacing: 20,
          title: Text("Wishlist",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 20))),
      body: BlocProvider(
        create: ((context) {
          final bloc = FavoriteBloc(favoriteproductLocalRepository);
          bloc.add(FavoriteStarted());
          return bloc;
        }),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: ((context, state) {
          if (state is FavoriteLoading) {
            return const LoadingState();
          } else if (state is FavoriteEmpty) {
            return const Center(
              child: EmptyState(
                  image: SizedBox(
                    width: 250,
                    height: 250,
                    child: LocalImageService(
                        imageSvgOrAnutherVersion: true,
                        localImageAddres: "assets/svg/empty_cart.svg"),
                  ),
                  text: "You dont have Wishlist!",
                  buttonClicked: SizedBox()),
            );
          } else if (state is FavoriteFailed) {
            return EmptyState(
                image: const SizedBox(
                  width: 250,
                  height: 250,
                  child: LocalImageService(
                      localImageAddres: "assets/svg/no_data.svg",
                      imageSvgOrAnutherVersion: true),
                ),
                text: "We have Problems",
                buttonClicked: Container());
          } else if (state is FavoriteSuccess) {
            return ListView.builder(
                itemCount: state.product.length,
                itemBuilder: ((context, index) {
                  return _ItemFavoriteProduct(state.product[index]);
                }));
          } else {
            throw "Bad state";
          }
        })),
      ),
    );
  }
}

class _ItemFavoriteProduct extends StatelessWidget {
  final ProductEntity productEntity;
  const _ItemFavoriteProduct(this.productEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 6),
            child: SizedBox(
                width: 120,
                height: 146,
                child: ImageLoadingService(
                    borderRadius: BorderRadius.circular(12),
                    imageUrl: productEntity.image)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.category,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        productEntity.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        productEntity.price.withPriceLabel,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
                Column(
                  children: [
                    Row(children: [
                      const SizedBox(width: 10),
                      const Text("remove product"),
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            BlocProvider.of<FavoriteBloc>(context).add(
                                FavoriteButtonUpdateProduct(productEntity));
                          },
                          icon: const Icon(Icons.dangerous_outlined))
                    ]),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
