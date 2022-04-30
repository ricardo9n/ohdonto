import 'package:dartz/dartz.dart';
import 'package:ohdonto/shared/usecase.dart';

import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';

abstract class SignInUsecase
    extends Usecase<Either<Failure, UserEntity>, UserSignInCredentialParam> {}

class UserSignInCredentialParam {
  String email;
  String password;
  UserSignInCredentialParam({required this.email, required this.password});
}
