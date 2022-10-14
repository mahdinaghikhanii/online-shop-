part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsStarted extends DetailsEvent {}

class DetailsButtonClickedAddToCart extends DetailsEvent {
  final ProductEntity productEntity;

  const DetailsButtonClickedAddToCart(this.productEntity);
  @override
  List<Object> get props => [productEntity];
}

class DetailsButtonClickedAddToFavorite extends DetailsEvent {
  final ProductEntity productEntity;

  const DetailsButtonClickedAddToFavorite(this.productEntity);
  @override
  List<Object> get props => [productEntity];
}
