part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  final AuthEntity? authEntity;
  const CartStarted(this.authEntity);
  @override
  List<Object> get props => [authEntity!];
}
