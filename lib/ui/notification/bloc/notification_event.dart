part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationStarted extends NotificationEvent {}

class NotificationButtonDelete extends NotificationEvent {}
