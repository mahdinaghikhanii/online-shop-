part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteStarted extends FavoriteEvent {}

class FavoriteButtonUpdateProduct extends FavoriteEvent {}
