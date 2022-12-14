part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthButtonIsClicked extends AuthEvent {
  final String email;
  final String password;

  const AuthButtonIsClicked(this.email, this.password);
}

class AuthModeChangeIsClicked extends AuthEvent {}

class AuthModeChangeobsecureText extends AuthEvent {}
