import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_event.dart';

part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc()
      : super(const PasswordState(
            password: '',
            confirmPassword: '',
            isPasswordValid: false,
            isConfirmPasswordValid: false)) {
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<PasswordSubmitted>(_onPasswordSubmitted);
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<PasswordState> emit) {
    final password = event.password;
    final newState = state.copyWith(
        password: password,
        isPasswordValid: _isValid(password),
        isConfirmPasswordValid:
            _isValid(password) && password == state.confirmPassword);
    emit(newState);
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<PasswordState> emit) {
    final password = event.confirmPassword;
    final newState = state.copyWith(
        confirmPassword: password,
        isConfirmPasswordValid:
            _isValid(password) && password == state.password);
    emit(newState);
  }

  void _onPasswordSubmitted(
      PasswordSubmitted event, Emitter<PasswordState> emit) {
    emit(const PasswordState(
        password: '',
        confirmPassword: '',
        isPasswordValid: false,
        isConfirmPasswordValid: false));
  }

  bool _isValid(String password) {
    return password.length > 8;
  }
}
