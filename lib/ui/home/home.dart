import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/entity/product.dart';

import '../../data/repo/product_category_repository.dart';
import '../callaction/callaction.dart';
import '../widgets/choice_chip.dart';
import '../widgets/empty_state.dart';
import '../widgets/large_title.dart';
import '../widgets/loading_state.dart';
import '../../data/repo/product_repository.dart';

import '../widgets/horizontal_listview.dart';
import 'bloc/home_bloc.dart';
import '../widgets/slider.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        final bloc = HomeBloc(
            productRepository, productRepository, productCategoryRepository);
        bloc.add(HomeStarted());
        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
          if (state is HomeLoading) {
            return const LoadingState();
          } else if (state is HomeSuccess) {
            return SafeArea(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 5),
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
                                        .copyWith(
                                            letterSpacing: 5, fontSize: 25),
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

                      case 2:
                        return ListChoiceChip(state.category);

                      case 3:
                        return LargeTitle(
                            firstTitle: "All callection",
                            secoundTitle: "See all",
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllCallactionScren(
                                      selectedCategoryOrAllProduct:
                                          ProdcutSort().allProduct)));
                            },
                            item: HorizontalListView(
                                productEntity: state.allproduct));
                      case 4:
                        return LargeTitle(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllCallactionScren(
                                      selectedCategoryOrAllProduct:
                                          ProdcutSort().womensclothing)));
                            },
                            firstTitle: "New women's clothing",
                            secoundTitle: "See all",
                            item: HorizontalListView(
                                productEntity: state.singleProduct));
                      default:
                        return Container();
                    }
                  }),
            );
          } else if (state is HomeError) {
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
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                      },
                      child: Text(
                        "Refresh",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black),
                      ))),
            );
          } else {
            throw "bad State";
          }
        })),
      ),
    );
  }
}
