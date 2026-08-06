import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> sendOtp() async {
    emit(state.copyWith(isLoading: true));

    // TODO: Send OTP

    emit(state.copyWith(isLoading: false));
  }

  Future<void> verifyOtp(String otp) async {
    emit(state.copyWith(isLoading: true));

    // TODO: Verify OTP

    emit(state.copyWith(isLoading: false));
  }
}