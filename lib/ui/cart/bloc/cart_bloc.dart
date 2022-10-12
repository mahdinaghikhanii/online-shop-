import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';
import 'package:online_shop/data/entity/auth.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartEvent>((event, emit) {
      if (event is CartStarted) {
        if (event.authEntity == null || event.authEntity!.token.isEmpty) {
          emit(CartAuthReaurid());
        } else {
          emit(CartLoading());
        }
      }
    });
  }
}
