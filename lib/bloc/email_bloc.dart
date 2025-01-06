import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_bloc/utils.dart';

part 'email_event.dart';

part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(const EmailState(email: '', isValid: false)) {
    on<EmailChanged>(_onEmailChanged);
    on<EmailSubmitted>(_onEmailSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<EmailState> emit) {
    final email = event.email;
    final isValid = emailRegExp.hasMatch(event.email);
    emit(EmailState(email: email, isValid: isValid));
  }

  void _onEmailSubmitted(EmailSubmitted event, Emitter<EmailState> emit) {
    emit(const EmailState(email: '', isValid: false));
  }
}
