part of 'callaction_bloc.dart';

abstract class CallactionState extends Equatable {
  const CallactionState();

  @override
  List<Object> get props => [];
}

class CallactionLoading extends CallactionState {}

class CallactionSingleProductSuccess extends CallactionState {
  final List<ProductEntity> singleProduct;

  const CallactionSingleProductSuccess({required this.singleProduct});

  @override
  List<Object> get props => [singleProduct];
}

class CallactionAllProductSuccess extends CallactionState {
  final List<ProductEntity> allProducts;

  const CallactionAllProductSuccess({required this.allProducts});

  @override
  List<Object> get props => [allProducts];
}

class CallactionError extends CallactionState {
  final AppException exception;

  const CallactionError(this.exception);

  @override
  List<Object> get props => [exception];
}
