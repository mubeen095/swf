import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/auth/controllers/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthController authController; 
  SignupBloc({required this.authController}) : super(const SignupState(status: SignupStatus.initial)) {
    // final authController = getIt.get<AuthController>();
    on<RequestSignup>((event, emit) async {
      emit(state.copyWith(status: SignupStatus.requestSignupLoading));

      final failureOrSuccess = await authController.signup(
          mobileNo: event.mobileNo,
          password: event.password,
          confirmPassword: event.confirmPassword);

      failureOrSuccess.fold(
          (l) =>
              emit(state.copyWith(status: SignupStatus.requestSignupError)),
          (r) => emit(
                state.copyWith(status: SignupStatus.requestSignupSuccess),
              ));
    });

    on<VerifyOTP>((event, emit) async {
      emit(state.copyWith(status: SignupStatus.verifyOTPLoading));
      final failureOrSuccess =
          await authController.verifyOTP(otpCode: event.otpCode);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(status: SignupStatus.verifyOTPError)),
          (r) => emit(state.copyWith(status: SignupStatus.verifyOTPSuccess)));
    });
  }
}
