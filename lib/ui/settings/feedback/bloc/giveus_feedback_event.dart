part of 'giveus_feedback_bloc.dart';

abstract class GiveusFeedbackEvent extends Equatable {
  const GiveusFeedbackEvent();

  @override
  List<Object> get props => [];
}

class GiveUsFeedBackButtonClickedSendInformation extends GiveusFeedbackEvent {
  final String emailAddres;
  final String username;
  final String subject;
  final String message;

  @override
  List<Object> get props => [emailAddres, username, subject, message];

  const GiveUsFeedBackButtonClickedSendInformation(
      this.emailAddres, this.message, this.subject, this.username);
}
