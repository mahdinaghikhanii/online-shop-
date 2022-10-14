part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  final AuthEntity? authEntity;
  final bool isRefreshing;

  const CartStarted(this.authEntity, {this.isRefreshing = false});
}

class CartAuthInfoChanges extends CartEvent {
  final AuthEntity? authEntity;

  const CartAuthInfoChanges(this.authEntity);
}

class CartAddProducts extends CartEvent {}
