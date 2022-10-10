part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductEntity> allproduct;
  final List<ProductEntity> singleProduct;
  final List<CategoryEntity> category;

  const HomeSuccess(
      {required this.allproduct,
      required this.singleProduct,
      required this.category});

  @override
  List<Object> get props => [allproduct, category, singleProduct];
}

class HomeError extends HomeState {
  final AppException exception;

  const HomeError(this.exception);

  @override
  List<Object> get props => [exception];
}

class HomeChangeChoiceChip extends HomeState {
  final int seleCthoiceChip;
  const HomeChangeChoiceChip(this.seleCthoiceChip);
}
