import 'package:dartz/dartz.dart';
import 'signup_code_verification_datasource.dart'
    show SignupCodeVerificationDatasource;
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart'
    show VerificationCodeParam;

import '../core/failure.dart' show Failure, VerificationCodeNotMatchFailure;

class FormBasedSignupCodeVerificationDatasource
    implements SignupCodeVerificationDatasource {
  @override
  Future<Either<Failure, bool>> verifySignUpCode(
      VerificationCodeParam param) async {
    if (param.code.length == 4) {
      return right(true);
    }
    return left(
        VerificationCodeNotMatchFailure(errorMessage: "Codigo invalido"));
  }
}
