part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {

const factory SignupState({
  
  required SignupStatus status
})=_SignupState;
}
enum SignupStatus{
  initial,
  requestSignupLoading,
  requestSignupSuccess,
  requestSignupError,
  verifyOTPLoading,
  verifyOTPSuccess,
  verifyOTPError
}
 
