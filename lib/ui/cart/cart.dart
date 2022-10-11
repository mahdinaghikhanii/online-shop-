import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/ui/auth/auth.dart';
import 'package:online_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';

class CartScren extends StatelessWidget {
  const CartScren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        final bloc = CartBloc();
        bloc.add(CartStarted());
        return bloc;
      }),
      child: BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
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
      })),
    );
  }
}
