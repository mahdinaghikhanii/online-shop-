part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartEntity> allProductsCart;
  const CartSuccess(this.allProductsCart);

  @override
  List<Object> get props => [allProductsCart];
}

class CartError extends CartState {
  final AppException exception;

  const CartError(this.exception);

  @override
  List<Object> get props => [exception];
}

class CartAuthReaurid extends CartState {}

class CartIsEmpty extends CartState {}
