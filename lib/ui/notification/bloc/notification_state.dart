part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationEmpty extends NotificationState {}

class NotifucationSucces extends NotificationState {}

class NotificationError extends NotificationState {
  final AppException exception;
  const NotificationError(this.exception);
  @override
  List<Object> get props => [exception];
}
