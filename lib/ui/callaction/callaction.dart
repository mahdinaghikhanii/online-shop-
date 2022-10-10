import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
        body: BlocProvider<CallactionBloc>(
      create: ((context) {
        final bloc = CallactionBloc();
        bloc.add(CallactionStarted(
            selectedCategoryOrAllProduct: selectedCategoryOrAllProduct));
        return bloc;
      }),
      child: Scaffold(
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
            } else if (state is CallactionSuccess) {
              return Container();
            } else {
              throw "bad state";
            }
          },
        ),
      ),
    ));
  }
}
