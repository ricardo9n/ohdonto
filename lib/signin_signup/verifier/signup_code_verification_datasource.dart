import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup/verifier/verification_usecase.dart';

import '../../core/failure.dart';

abstract class SignupCodeVerificationDatasource {
  Future<Either<Failure, bool>> verifySignUpCode(VerificationCodeParam param);
}
