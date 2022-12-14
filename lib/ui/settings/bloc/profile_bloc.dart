import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/entity/auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super((ProfilelInitial())) {
    on<ProfileEvent>((event, emit) {
      if (event is ProfileStarted) {
        final auth = event.authEntity;
        if (auth == null || auth.token.isEmpty) {
          emit(ProfileNotEntered());
        } else {
          emit(ProfileEntered());
        }
      }
    });
  }
}
