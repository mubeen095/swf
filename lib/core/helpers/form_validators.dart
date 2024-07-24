import 'package:form_validation/form_validation.dart';

class FormValidators {

    String? validateRequired(String? value){
      final validator = Validator(
      validators: [
        const RequiredValidator(),
      ],
    );
    return validator.validate(
      label: 'Field',
      value: value,
    );
    }

  String? validateEmail(String? email) {
    final validator = Validator(
      validators: [
        const RequiredValidator(),
        const EmailValidator(),
      ],
    );

    return validator.validate(
      label: 'Email',
      value: email,
    );
  }

  String? validateMobileNumber(String? mobileNumber) {
    final validator = Validator(
      validators: [
        const RequiredValidator(),
        const PhoneNumberValidator(),
        const MinLengthValidator(length: 10),
        const MaxLengthValidator(length: 10),
      ],
    );

    return validator.validate(
      label: 'Mobile number',
      value: mobileNumber,
    );
  }

  String? validatePassword(String? password) {
    final validator = Validator(
      validators: [
        const RequiredValidator(),
        const MinLengthValidator(length: 6),
        const MaxLengthValidator(length: 20),
      ],
    );

    return validator.validate(
      label: 'Password',
      value: password,
    );
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    } else if (confirmPassword.trim() == password?.trim()) {
      return validatePassword(password);
    } else if (confirmPassword.trim() != password?.trim()) {
      return "Confirm  password do not match password";
    }
    return null;
  }
}
