import 'package:ohdonto/verify/incorrect_signup_verification_code_failure.dart';
import 'package:ohdonto/verify/signup_code_verification_datasource.dart';
import 'package:ohdonto/verify/signup_verification_repository.dart'
    show SignUpVerificationRepository;

class FormBasedSignUpVerificationRepository
    implements SignUpVerificationRepository {
  SignupCodeVerificationDatasource? datasource;

  FormBasedSignUpVerificationRepository(this.datasource);

  @override
  bool verifySignUpCode(String code) {
    try {
      return datasource!.verifySignUpCode(code);
    } on IncorrectSignUpVerificationCodeFailure {
      return false;
    }
  }
}
