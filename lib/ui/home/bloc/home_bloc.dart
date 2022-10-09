import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/entity/category.dart';
import 'package:online_shop/data/repo/product_category_repository.dart';

import '../../../common/exception.dart';
import '../../../data/entity/product.dart';
import '../../../data/repo/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IProductRepository productRepository;
  IProductCateGoryRepository iProductCateGoryRepository;

  HomeBloc(this.productRepository, this.iProductCateGoryRepository)
      : super((HomeLoading())) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final product = await productRepository.getAllProdcut();
          final category =
              await iProductCateGoryRepository.getAllProductCategory();
          emit(HomeSuccess(product: product, category: category));
          if (event is HomeChoiceChipClicked) {
            final select = event.selectChoiceChip;
          }
        } catch (e) {
          emit(HomeError(AppException()));
        }
      }
    });
  }
}
