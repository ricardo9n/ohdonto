import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart';

class FormBasedVerificationUsecase extends VerificationUsecase {
  @override
  Future<Either<Failure, bool>> call(VerificationCodeParam? param) async {
    if (param?.code.length != 4) {
      return left(
          InvalidCodeVerificationFailure(errorMessage: "codigo invalido"));
    }

    return right(true);
  }
}
