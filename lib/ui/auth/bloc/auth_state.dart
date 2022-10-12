part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState(this.isLoginMode);

  final bool isLoginMode;

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial(super.isLoginMode);
}

class AuthLoading extends AuthState {
  const AuthLoading(super.isLoginMode);
}

class AuthSuccess extends AuthState {
  const AuthSuccess(super.isLoginMode);

  @override
  List<Object> get props => [isLoginMode];
}

class AuthError extends AuthState {
  final AppException exception;

  const AuthError(this.exception) : super(false);

  @override
  List<Object> get props => [exception];
}
