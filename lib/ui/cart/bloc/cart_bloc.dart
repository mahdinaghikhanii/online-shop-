import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';
import 'package:online_shop/data/entity/auth.dart';
import 'package:online_shop/data/entity/product_entity.dart';
import 'package:online_shop/data/repo/local/product_local_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  ProductLocalRepository repository;
  CartBloc(this.repository) : super(CartLoading()) {
    on<CartEvent>((event, emit) async {
      if (event is CartStarted) {
        final authInfo = event.authEntity;
        if (authInfo == null || authInfo.token.isEmpty) {
          emit(CartAuthReaurid());
        } else {
          await cartItemsSuccess(emit, event.isRefreshing);
        }
        if (event is CartAuthInfoChanges) {
          if (authInfo == null || authInfo.token.isEmpty) {
            emit(CartAuthReaurid());
          } else {
            if (state is CartAuthReaurid) {
              await cartItemsSuccess(emit, false);
            }
          }
        }
      }
    });
  }

  Future<void> cartItemsSuccess(
      Emitter<CartState> emit, bool isRefreshing) async {
    try {
      if (!isRefreshing) {
        emit(CartLoading());
      }

      final allProductsCart = await repository.getAllProduct();
      if (allProductsCart.isEmpty) {
        emit(CartIsEmpty());
      } else {
        emit(CartSuccess(allProductsCart));
      }
    } catch (e) {
      emit(CartError(AppException()));
    }
  }
}
