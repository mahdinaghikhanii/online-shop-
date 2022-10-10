part of 'callaction_bloc.dart';

abstract class CallactionState extends Equatable {
  const CallactionState();

  @override
  List<Object> get props => [];
}

class CallactionLoading extends CallactionState {}

class CallactionSuccess extends CallactionState {
  final List<ProductEntity> allproduct;
  final List<ProductEntity> singleProduct;

  const CallactionSuccess(
      {required this.allproduct, required this.singleProduct});

  @override
  List<Object> get props => [allproduct, singleProduct];
}

class CallactionError extends CallactionState {
  final AppException exception;

  const CallactionError(this.exception);

  @override
  List<Object> get props => [exception];
}
