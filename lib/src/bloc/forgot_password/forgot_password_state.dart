import 'package:equatable/equatable.dart';

abstract class ForgotPasswordState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ForgotPasswordWasNotSent extends ForgotPasswordState {}

class ForgotPasswordSendingMail extends ForgotPasswordState {}

class MailForgotPasswordSent extends ForgotPasswordState {
  final _email;
  MailForgotPasswordSent(this._email);
  @override
  // TODO: implement props
  List<Object> get props => [_email];
}

class ForgotPasswordNotSend extends ForgotPasswordState {}
