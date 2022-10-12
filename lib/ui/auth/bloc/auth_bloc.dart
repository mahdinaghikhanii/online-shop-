import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/common/exception.dart';

import 'package:online_shop/data/repo/remote/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool isLoginMode;
  final AuthRepository repository;
  AuthBloc(this.repository, {this.isLoginMode = true})
      : super(AuthInitial(isLoginMode)) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthButtonIsClicked) {
          emit(AuthLoading(isLoginMode));
          await repository.login(event.email, event.password);
          emit(AuthSuccess(isLoginMode));
        }
      } catch (e) {
        emit(AuthError(AppException()));
      }
    });
  }
}
