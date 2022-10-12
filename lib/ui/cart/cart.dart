import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'package:online_shop/ui/auth/auth.dart';
import 'package:online_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';
import 'package:online_shop/ui/widgets/image_local.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

class CartScren extends StatelessWidget {
  const CartScren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        final bloc = CartBloc();
        bloc.add(CartStarted(AuthRepository.authChangeNotifire.value));
        return bloc;
      }),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 16,
          elevation: 0,
          title: Text(
            "My cart",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white, fontSize: 24),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
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
            return const _ItemCart();
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
  const _ItemCart();

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
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 6),
            child: SizedBox(
                width: 120,
                height: 146,
                child: LocalImageService(
                  localImageAddres: "assets/img/wo.png",
                )),
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
                        "Mens",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Original levis dain jasdjsadhjas djs hdjshd jsh ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "\$22",
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
