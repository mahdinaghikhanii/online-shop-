part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteStarted extends FavoriteEvent {}

class FavoriteButtonUpdateProduct extends FavoriteEvent {
  final ProductEntity productEntity;
  @override
  List<Object> get props => [productEntity];

  const FavoriteButtonUpdateProduct(this.productEntity);
}

class FavoriteButtonDeleteProduct extends FavoriteEvent {
  final ProductEntity productEntity;
  @override
  List<Object> get props => [productEntity];

  const FavoriteButtonDeleteProduct(this.productEntity);
}
