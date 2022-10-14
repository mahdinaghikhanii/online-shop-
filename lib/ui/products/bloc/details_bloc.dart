import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';
import 'package:online_shop/data/entity/product_entity.dart';
import 'package:online_shop/data/repo/local/product_local_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  ProductLocalRepository localRepository;
  DetailsBloc(this.localRepository) : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) {
      if (event is DetailsButtonClickedAddToCart) {
        try {
          emit(DetailsAddToCartLoading());
          localRepository.addProducts(event.productEntity);
          emit(DetailsAddToCartSuccess());
        } catch (e) {
          emit(DetailsAddToCartError(AppException()));
        }
      }
    });
  }
}
