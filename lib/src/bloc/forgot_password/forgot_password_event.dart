import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ResetForgotPassword extends ForgotPasswordEvent {}

class SendMail extends ForgotPasswordEvent {
  final _email;
  SendMail(this._email);
  @override
  // TODO: implement props
  List<Object> get props => [_email];
}
