import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';
import 'package:online_shop/data/entity/product.dart';
import 'package:online_shop/data/repo/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, HomeState> {
  IProductRepository productRepository;

  ProductBloc(this.productRepository) : super((HomeLoading())) {
    on<ProductEvent>((event, emit) async {
      if (event is HomeStarted) {
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
