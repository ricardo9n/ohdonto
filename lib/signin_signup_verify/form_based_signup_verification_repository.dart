import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup_verify/signup_code_verification_datasource.dart';
import 'package:ohdonto/signin_signup_verify/signup_verification_repository.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart';

class FormBasedSignUpVerificationRepository
    implements
        SignUpVerificationRepository<Future<Either<Failure, bool>>,
            VerificationCodeParam> {
  SignupCodeVerificationDatasource? datasource;

  FormBasedSignUpVerificationRepository(this.datasource);

  @override
  Future<Either<Failure, bool>> verifySignUpCode(
      VerificationCodeParam param) async {
    return await datasource!.verifySignUpCode(param);
  }
}
