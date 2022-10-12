import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/data/repo/remote/auth_repository.dart';
import 'package:online_shop/ui/auth/auth.dart';
import 'package:online_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';
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
      child: BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
        if (state is CartAuthReaurid) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyState(
                  image: SvgPicture.asset(
                    "assets/svg/auth.svg",
                    width: 300,
                    height: 300,
                  ),
                  text: "Please create account or login",
                  buttonClicked: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: ((context) => AuthScrean())));
                      },
                      child: Text(
                        "Login or signup",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black),
                      )))
            ],
          );
        } else if (state is CartLoading) {
          return const LoadingState();
        } else if (state is CartSuccess) {
          return Container();
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    child: Text(
                      "Refresh",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                    ))),
          );
        } else {
          throw " bad state";
        }
      })),
    );
  }
}
