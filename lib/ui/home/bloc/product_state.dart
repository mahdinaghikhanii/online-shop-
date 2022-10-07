part of 'product_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductEntity> product;

  const HomeSuccess({required this.product});

  @override
  List<Object> get props => [product];
}

class HomeError extends HomeState {
  final AppException exception;

  const HomeError(this.exception);

  @override
  List<Object> get props => [exception];
}
