import 'package:ohdonto/signin_signup_verify/signup_code_verification_datasource.dart'
    show SignupCodeVerificationDatasource;

import 'incorrect_signup_verification_code_failure.dart'
    show IncorrectSignUpVerificationCodeFailure;

class FormBasedSignupCodeVerificationDatasource
    implements SignupCodeVerificationDatasource {
  @override
  bool verifySignUpCode(String code) {
    if (code.length > 10) {
      return true;
    } else {
      throw IncorrectSignUpVerificationCodeFailure();
    }
  }
}
