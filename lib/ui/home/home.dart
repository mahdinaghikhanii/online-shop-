import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/repo/product_repository.dart';
import 'package:online_shop/ui/home/bloc/product_bloc.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) {
        final bloc = ProductBloc(productRepository);
        bloc.add(HomeStarted());
        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<ProductBloc, HomeState>(builder: ((context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is HomeSuccess) {
            return ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container();

                    case 1:
                      return Container();
                    default:
                      return Container();
                  }
                });
          } else if (state is HomeError) {
            return Center(
              child: Text(state.exception.exceptionMessage),
            );
          } else {
            throw "bad State";
          }
        })),
      ),
    );
  }
}
