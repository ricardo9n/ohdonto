import 'package:either_dart/either.dart';

abstract class SignUpVerificationUsecase {
  Either<String, bool> callback(String code);
}
