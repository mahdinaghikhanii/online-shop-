import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/exception.dart';
import '../../../data/entity/product.dart';
import '../../../data/repo/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IProductRepository productRepository;

  HomeBloc(this.productRepository) : super((HomeLoading())) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final product = await productRepository.getAllProdcut();
          emit(HomeSuccess(product: product));
        } catch (e) {
          emit(HomeError(AppException()));
        }
      }
    });
  }
}
