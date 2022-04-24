import 'package:dartz/dartz.dart';
import 'package:ohdonto/core/usecase.dart';

import 'package:ohdonto/core/failure.dart';

class VerificationCodeParam {
  String code;
  String email;

  VerificationCodeParam({required this.code, required this.email});
}

abstract class VerificationUsecase
    extends Usecase<Either<Failure, bool>, VerificationCodeParam> {}
