import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup_verify/usecase.dart';

import '../core/failure.dart';

class VerificationCodeParam {
  String code;
  String email;

  VerificationCodeParam({required this.code, required this.email});
}

abstract class VerificationUsecase
    extends Usecase<Either<Failure, bool>, VerificationCodeParam> {}
