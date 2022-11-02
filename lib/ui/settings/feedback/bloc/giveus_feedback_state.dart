part of 'giveus_feedback_bloc.dart';

abstract class GiveusFeedbackState extends Equatable {
  const GiveusFeedbackState();

  @override
  List<Object> get props => [];
}

class GiveusFeedbackInitial extends GiveusFeedbackState {}

class GiveUsFeedBackSuccess extends GiveusFeedbackState {}

class GiveUsFeedBackLoading extends GiveusFeedbackState {}

class GiveUsFeedBackFailed extends GiveusFeedbackState {
  final AppException appException;

  @override
  List<Object> get props => [appException];

  const GiveUsFeedBackFailed(this.appException);
}

class GiveUsFeedBackEmptyTextFromFiled extends GiveusFeedbackState {}
