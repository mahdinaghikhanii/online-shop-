part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsAddToCartLoading extends DetailsState {}

class DetailsAddToCartError extends DetailsState {
  final AppException exception;
  const DetailsAddToCartError(this.exception);

  @override
  List<Object> get props => [exception];
}

class DetailsAddToCartSuccess extends DetailsState {}
