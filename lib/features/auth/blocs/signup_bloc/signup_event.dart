part of 'signup_bloc.dart';

@immutable
class SignupEvent {}

class RequestSignup extends SignupEvent{
  final String mobileNo;
  final String password;
  final String confirmPassword;

  RequestSignup({required this.mobileNo, required this.password, required this.confirmPassword});
}
class VerifyOTP extends SignupEvent {
  final String otpCode;

  VerifyOTP({required this.otpCode});

}