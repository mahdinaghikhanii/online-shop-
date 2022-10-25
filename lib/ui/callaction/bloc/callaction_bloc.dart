import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/exception.dart';
import '../../../data/entity/product_entity.dart';
import '../../../data/repo/remote/product_repository.dart';

part 'callaction_event.dart';
part 'callaction_state.dart';

class CallactionBloc extends Bloc<CallactionEvent, CallactionState> {
  final IProductRepository allproductsRepository;
  final IProductRepository singleProductsRepository;
  CallactionBloc(this.allproductsRepository, this.singleProductsRepository)
      : super(CallactionLoading()) {
    on<CallactionEvent>((event, emit) async {
      if (event is CallactionStarted) {
        try {
          emit(CallactionLoading());
          if (event.selectedCategoryOrAllProduct == ProdcutSort().allProduct) {
            final allProduct = await allproductsRepository.getAllProdcut();
            emit(CallactionAllProductSuccess(allProducts: allProduct));
          } else {
            final singleProduct = await singleProductsRepository
                .getASingleProdcut(event.selectedCategoryOrAllProduct);

            emit(CallactionSingleProductSuccess(singleProduct: singleProduct));
          }
        } catch (e) {
          emit(CallactionError(AppException()));
        }
      }
    });
  }
}
