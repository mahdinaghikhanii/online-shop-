// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Column,
        Container,
        CustomScrollView,
        EdgeInsets,
        Expanded,
        FloatingActionButton,
        FloatingActionButtonLocation,
        Icon,
        IconButton,
        Icons,
        MainAxisAlignment,
        MediaQuery,
        Navigator,
        Padding,
        Radius,
        Row,
        SafeArea,
        Scaffold,
        ScaffoldMessenger,
        SizedBox,
        SliverAppBar,
        SliverToBoxAdapter,
        SnackBar,
        StatelessWidget,
        Text,
        TextStyle,
        Theme,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/ui/products/bloc/details_bloc.dart';
import 'package:online_shop/ui/widgets/loading_state.dart';

import '../../common/utils.dart';
import 'package:online_shop/data/entity/product_entity.dart';
import 'package:online_shop/ui/widgets/image_remote.dart';

class ProductDetailsScren extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailsScren({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (BuildContext context) {
        final bloc = DetailsBloc();

        bloc.stream.listen((state) {
          if (state is DetailsAddToCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Done ! add your cart",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ));
          } else if (state is DetailsAddToCartError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.exception.exceptionMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        });

        return bloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) => FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {
                    BlocProvider.of<DetailsBloc>(context)
                        .add(DetailsButtonClickedAddToCart(productEntity));
                  },
                  label: state is DetailsAddToCartLoading
                      ? const LoadingState()
                      : const Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.black),
                        )),
            )),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.width * 0.9,
                flexibleSpace:
                    ImageLoadingService(imageUrl: productEntity.image),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconButton(
                        color: Theme.of(context).colorScheme.onSecondary,
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline)),
                  )
                ],
                automaticallyImplyLeading: false,
                leadingWidth: 50,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: IconButton(
                      color: Theme.of(context).colorScheme.onSecondary,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productEntity.title,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    productEntity.price.withPriceLabel
                                        .toString(),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              productEntity.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      height: 1.7,
                                      wordSpacing: 1.4,
                                      fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
