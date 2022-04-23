import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart';

abstract class SignupCodeVerificationDatasource {
  Future<Either<Failure, bool>> verifySignUpCode(VerificationCodeParam param);
}
