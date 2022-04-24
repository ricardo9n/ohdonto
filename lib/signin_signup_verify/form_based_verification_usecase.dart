import 'package:dartz/dartz.dart';

import '../core/failure.dart';
import 'signup_verification_repository.dart';
import 'verification_usecase.dart';

class FormBasedVerificationUsecase extends VerificationUsecase {
  SignUpVerificationRepository repository;

  FormBasedVerificationUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(VerificationCodeParam? param) async {
    if (param?.code.length != 4) {
      return left(
          InvalidCodeVerificationFailure(errorMessage: "codigo invalido!"));
    }
    return await repository.verifySignUpCode(param);
  }
}
