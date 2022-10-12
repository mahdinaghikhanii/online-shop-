part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState(this.isLoginMode, this.obsecureText);

  final bool isLoginMode;
  final bool obsecureText;

  @override
  List<Object> get props => [isLoginMode, obsecureText];
}

class AuthInitial extends AuthState {
  const AuthInitial(super.isLoginMode, super.obsecureText);
}

class AuthLoading extends AuthState {
  const AuthLoading(super.isLoginMode, super.obsecureText);
}

class AuthSuccess extends AuthState {
  const AuthSuccess(super.isLoginMode, super.obsecureText);

  @override
  List<Object> get props => [isLoginMode];
}

class AuthError extends AuthState {
  final AppException exception;

  const AuthError(this.exception) : super(false, false);

  @override
  List<Object> get props => [exception];
}
