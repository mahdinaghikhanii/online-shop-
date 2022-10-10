part of 'callaction_bloc.dart';

abstract class CallactionEvent extends Equatable {
  const CallactionEvent();

  @override
  List<Object> get props => [];
}

class CallactionStarted extends CallactionEvent {
  final String selectedCategoryOrAllProduct;
  const CallactionStarted({required this.selectedCategoryOrAllProduct});

  @override
  List<Object> get props => [selectedCategoryOrAllProduct];
}
