import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/data/repo/product_repository.dart';
import 'package:online_shop/ui/callaction/bloc/callaction_bloc.dart';
import 'package:online_shop/ui/widgets/empty_state.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

class AllCallactionScren extends StatelessWidget {
  /// 1  get a single product with category
  /// 2  get allProdcut
  final String selectedCategoryOrAllProduct;
  const AllCallactionScren(
      {super.key, required this.selectedCategoryOrAllProduct});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CallactionBloc>(
      create: ((context) {
        final bloc = CallactionBloc(productRepository, productRepository);
        bloc.add(CallactionStarted(
            selectedCategoryOrAllProduct: selectedCategoryOrAllProduct));
        return bloc;
      }),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 16,
          title: Text(
            "ZIMRO",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(letterSpacing: 5, fontSize: 25),
          ),
        ),
        body: BlocBuilder<CallactionBloc, CallactionState>(
          builder: (BuildContext context, state) {
            if (state is CallactionLoading) {
              return const LoadingState();
            } else if (state is CallactionError) {
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
            } else if (state is CallactionAllProductSuccess ||
                state is CallactionSingleProductSuccess) {
              return Container(
                color: Colors.amber,
                width: 200,
                height: 300,
              );
            } else {
              throw "bad state";
            }
          },
        ),
      ),
    );
  }
}
