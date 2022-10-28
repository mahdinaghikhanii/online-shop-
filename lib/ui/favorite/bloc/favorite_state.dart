part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailed extends FavoriteState {
  final AppException appException;
  const FavoriteFailed(this.appException);
}

class FavoriteSuccess extends FavoriteState {
  final List<ProductEntity> product;
  const FavoriteSuccess(this.product);
}
