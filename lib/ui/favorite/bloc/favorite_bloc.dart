import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';
import 'package:online_shop/data/entity/product_entity.dart';
import 'package:online_shop/data/repo/local/favorite_product_local_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteProductLocalRepository favoriteProductLocalRepository;
  FavoriteBloc(this.favoriteProductLocalRepository) : super(FavoriteLoading()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is FavoriteStarted) {
        try {
          loadCartItems(emit);
        } catch (e) {
          emit(FavoriteFailed(AppException()));
        }
      } else if (event is FavoriteButtonUpdateProduct) {
        try {
          await favoriteProductLocalRepository.addProducts(event.productEntity);
          emit(FavoriteSuccessUpdateFavorite());
          await loadCartItems(emit);
        } catch (e) {
          emit(FavoriteFailedUpadteFavorite(AppException()));
        }
      }
    });
  }
  Future<void> loadCartItems(Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    final favoriteProduct =
        await favoriteProductLocalRepository.getAllProduct();
    if (favoriteProduct.isEmpty) {
      emit(FavoriteEmpty());
    } else {
      emit(FavoriteSuccess(favoriteProduct));
    }
  }
}
