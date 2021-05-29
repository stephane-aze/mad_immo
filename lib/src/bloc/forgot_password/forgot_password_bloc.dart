import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(ForgotPasswordState initialState) : super(initialState);

  @override
  Stream<ForgotPasswordState> mapEventToState(event) async* {
    if (event is SendMail) {
      yield ForgotPasswordSendingMail();

      try {
        String result = "hello";
        yield MailForgotPasswordSent(result);
      } catch (_) {
        print(_);
        yield ForgotPasswordWasNotSent();
      }
    } else if (event is ResetForgotPassword) {
      yield ForgotPasswordNotSend();
    }
  }
}
