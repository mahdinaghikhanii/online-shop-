import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/common/utils.dart';
import 'package:online_shop/data/entity/product_entity.dart';

import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'package:online_shop/data/repo/remote/cart_repository.dart';
import 'package:online_shop/ui/auth/auth.dart';
import 'package:online_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';

import 'package:online_shop/ui/widgets/image_remote.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartScren extends StatefulWidget {
  const CartScren({super.key});

  @override
  State<CartScren> createState() => _CartScrenState();
}

class _CartScrenState extends State<CartScren> {
  final RefreshController _refreshController = RefreshController();
  CartBloc? cartBloc;
  StreamSubscription? stateStreamSubscription;

  @override
  void initState() {
    super.initState();
    AuthRepository.authChangeNotifire.addListener(valueListenChangeNotifire);
  }

  void valueListenChangeNotifire() {
    cartBloc!.add(CartAuthInfoChanges(AuthRepository.authChangeNotifire.value));
  }

  @override
  void dispose() {
    cartBloc!.close();
    AuthRepository.authChangeNotifire.removeListener(valueListenChangeNotifire);
    cartBloc!.close();
    stateStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 16,
        elevation: 0,
        title: Text(
          "My cart",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontSize: 22),
        ),
      ),
      body: BlocProvider<CartBloc>(
        create: ((context) {
          final bloc = CartBloc(cartRepository);
          cartBloc = bloc;

          stateStreamSubscription = bloc.stream.listen((state) {
            if (_refreshController.isRefresh) {
              if (state is CartSuccess) {
                _refreshController.refreshCompleted();
              }
            } else if (state is CartError) {
              _refreshController.refreshFailed();
            }
          });
          bloc.add(CartStarted(AuthRepository.authChangeNotifire.value));
          return bloc;
        }),
        child: BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
          if (state is CartAuthReaurid) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: EmptyState(
                      image: SvgPicture.asset(
                        "assets/svg/auth.svg",
                        width: 250,
                        height: 250,
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
                            "Login or signup",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white.withOpacity(0.4)),
                          ))),
                )
              ],
            );
          } else if (state is CartLoading) {
            return const LoadingState();
          } else if (state is CartSuccess) {
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                cartBloc?.add(CartStarted(
                    AuthRepository.authChangeNotifire.value,
                    isRefreshing: true));
              },
              child: ListView.builder(
                  itemCount: state.allProductsCart.length,
                  itemBuilder: (context, index) {
                    return Container();
                  }),
            );
          } else if (state is CartIsEmpty) {
            return Center(
              child: EmptyState(
                  image: SvgPicture.asset(
                    "assets/svg/empty_cart.svg",
                    width: 200,
                  ),
                  text: "Your cart is empty",
                  buttonClicked: Container()),
            );
          } else if (state is CartError) {
            return Center(
              child: EmptyState(
                  image: SvgPicture.asset(
                    "assets/svg/no_data.svg",
                    width: 200,
                  ),
                  text: state.exception.exceptionMessage,
                  buttonClicked: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.secondary)),
                      onPressed: () {},
                      child: Text(
                        "Refresh",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white.withOpacity(0.4)),
                      ))),
            );
          } else {
            throw " bad state";
          }
        })),
      ),
    );
  }
}

class _ItemCart extends StatelessWidget {
  final ProductEntity productEntity;
  const _ItemCart(this.productEntity);

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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  padding: const EdgeInsets.all(0),
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon:
                                      const Icon(CupertinoIcons.minus_circled)),
                              Text(
                                "2",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.plus_circle)),
                            ],
                          ),
                          IconButton(
                              color: Colors.white,
                              onPressed: () {},
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
