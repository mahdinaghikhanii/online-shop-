import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'giveus_feedback_event.dart';
part 'giveus_feedback_state.dart';

class GiveusFeedbackBloc
    extends Bloc<GiveusFeedbackEvent, GiveusFeedbackState> {
  GiveusFeedbackBloc() : super(GiveusFeedbackInitial()) {
    on<GiveusFeedbackEvent>((event, emit) {});
  }
}
