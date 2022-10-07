import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/repo/product_repository.dart';
import 'package:online_shop/theme.dart';
import 'package:online_shop/ui/home/bloc/product_bloc.dart';
import 'package:online_shop/ui/widgets/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
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
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "ZIMRO",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(letterSpacing: 5, fontSize: 25),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Welcome",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "zimro store!",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 24,
                                      wordSpacing: 2),
                            ),
                          ],
                        ),
                      );

                    case 1:
                      return SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          child: BannerSlider());
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
