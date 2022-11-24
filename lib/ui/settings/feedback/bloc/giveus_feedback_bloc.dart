import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/exception.dart';
import '../../../../data/repo/remote/giveus_feedback_repository.dart';

part 'giveus_feedback_event.dart';
part 'giveus_feedback_state.dart';

class GiveusFeedbackBloc
    extends Bloc<GiveusFeedbackEvent, GiveusFeedbackState> {
  GiveUsFeedBackRepository giveUsFeedBackRepository;
  GiveusFeedbackBloc(this.giveUsFeedBackRepository)
      : super(GiveusFeedbackInitial()) {
    on<GiveusFeedbackEvent>((event, emit) async {
      if (event is GiveUsFeedBackButtonClickedSendInformation) {
        try {
          emit(GiveUsFeedBackLoading());
          if (event.emailAddres.isEmpty |
              event.message.isEmpty |
              event.subject.isEmpty |
              event.username.isEmpty) {
            emit(GiveUsFeedBackEmptyTextFromFiled());
            emit(GiveusFeedbackInitial());
          } else {
            await giveUsFeedBackRepository.sendGiveUsFeedBack(event.emailAddres,
                event.username, event.subject, event.message);
            emit(GiveusFeedbackInitial());
            emit(GiveUsFeedBackSuccess());
          }
        } catch (e) {
          emit(GiveUsFeedBackFailed(AppException()));
        }
      }
    });
  }
}
