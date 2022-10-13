import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';

import 'package:online_shop/data/repo/remote/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool isLoginMode;
  bool obsecureText;
  final AuthRepository repository;
  AuthBloc(this.repository, {this.isLoginMode = true, this.obsecureText = true})
      : super(AuthInitial(isLoginMode, obsecureText)) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthButtonIsClicked) {
          emit(AuthLoading(isLoginMode, obsecureText));
          if (isLoginMode) {
            await repository.login(event.email, event.password);
            emit(AuthSuccess(isLoginMode, obsecureText));
          } else {
            emit(AuthLoading(isLoginMode, obsecureText));
            await repository.signUp(event.email, event.password);
            emit(AuthSuccess(isLoginMode, obsecureText));
          }
        } else if (event is AuthModeChangeIsClicked) {
          isLoginMode = !isLoginMode;
          emit(AuthInitial(isLoginMode, obsecureText));
        } else if (event is AuthModeChangeobsecureText) {
          obsecureText = !obsecureText;
          emit(AuthInitial(isLoginMode, obsecureText));
        }
      } catch (e) {
        emit(AuthError(AppException()));
      }
    });
  }
}
