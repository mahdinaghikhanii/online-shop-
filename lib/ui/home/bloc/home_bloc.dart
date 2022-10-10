import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/entity/category.dart';
import '../../../data/repo/product_category_repository.dart';

import '../../../common/exception.dart';
import '../../../data/entity/product.dart';
import '../../../data/repo/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IProductRepository allproductRepository;
  IProductRepository singleProductRepository;
  IProductCateGoryRepository iProductCateGoryRepository;

  HomeBloc(this.allproductRepository, this.singleProductRepository,
      this.iProductCateGoryRepository)
      : super((HomeLoading())) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final allProduct = await productRepository.getAllProdcut();
          final singleProduct =
              await productRepository.getASingleProdcut("women's clothing");
          final category =
              await iProductCateGoryRepository.getAllProductCategory();
          emit(HomeSuccess(
              allproduct: allProduct,
              category: category,
              singleProduct: singleProduct));
          if (event is HomeChoiceChipClicked) {
            //  final select = event.selectChoiceChip;
          }
        } catch (e) {
          emit(HomeError(AppException()));
        }
      }
    });
  }
}
