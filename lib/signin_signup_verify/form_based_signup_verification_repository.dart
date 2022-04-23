import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup_verify/incorrect_signup_verification_code_failure.dart';
import 'package:ohdonto/signin_signup_verify/signup_code_verification_datasource.dart';
import 'package:ohdonto/signin_signup_verify/signup_verification_repository.dart'
    show SignUpVerificationRepository;
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart';

class FormBasedSignUpVerificationRepository
    implements SignUpVerificationRepository {
  SignupCodeVerificationDatasource? datasource;

  FormBasedSignUpVerificationRepository(this.datasource);

  @override
  Future<Either<Failure, bool>> verifySignUpCode(VerificationCodeParam param) {
    return datasource!.verifySignUpCode(param);
  }
}
