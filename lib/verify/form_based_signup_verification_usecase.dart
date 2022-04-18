import 'package:either_dart/either.dart';

import 'package:ohdonto/verify/signup_verification_usecase.dart';

class FormBasedSignUpVerificationUsecase implements SignUpVerificationUsecase {
  @override
  Either<String, bool> callback(String code) {
    if (code.length == 4) {
      return const Right(true);
    }
    return const Left("left");
  }
}
