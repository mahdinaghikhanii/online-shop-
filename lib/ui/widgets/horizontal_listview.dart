import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/repo/local/favorite_product_local_repository.dart';
import 'package:online_shop/ui/favorite/bloc/favorite_bloc.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

import '../../common/utils.dart';
import '../../data/entity/product_entity.dart';
import '../products/details..dart';
import 'image_remote.dart';

class HorizontalListView extends StatelessWidget {
  final List<ProductEntity> productEntity;
  const HorizontalListView({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 270,
      child: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.only(left: 16, top: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Container(
              width: 140,
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () => Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: ((context) => ProductDetailsScren(
                            productEntity: productEntity[index])))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 140,
                          height: 156,
                          child: ImageLoadingService(
                              borderRadius: BorderRadius.circular(20),
                              imageUrl: productEntity[index].image),
                        ),
                        Positioned(
                            left: 60,
                            right: 0,
                            top: 0,
                            child: BlocProvider(
                              create: (BuildContext context) {
                                final bloc = FavoriteBloc(
                                    favoriteproductLocalRepository);
                                bloc.add(FavoriteStarted());
                                bloc.stream.listen((state) {
                                  if (state is FavoriteSuccessUpdateFavorite) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            content: Text(
                                              "mission accomplished",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors.black),
                                            )));
                                  } else if (state
                                      is FavoriteFailedUpadteFavorite) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            content: Text(
                                              state.appException
                                                  .exceptionMessage,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors.black),
                                            )));
                                  }
                                });
                                return bloc;
                              },
                              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                                builder: (BuildContext context, state) {
                                  return IconButton(
                                      onPressed: () {
                                        BlocProvider.of<FavoriteBloc>(context)
                                            .add(FavoriteButtonUpdateProduct(
                                                productEntity[index]));
                                      },
                                      icon: state is FavoriteLoading
                                          ? const LoadingState()
                                          : const Icon(Icons.favorite_border));
                                },
                              ),
                            )),
                        Positioned(
                            left: 68,
                            right: 0,
                            bottom: 10,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.primary),
                              child: const Icon(
                                CupertinoIcons.cart,
                                size: 16,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      productEntity[index].title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(overflow: TextOverflow.clip),
                      maxLines: 2,
                    ),
                    Text(
                      productEntity[index].price.withPriceLabel.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
