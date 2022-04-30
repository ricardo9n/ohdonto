import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart' show UserEntity;

import 'package:ohdonto/shared/failure.dart';

abstract class SignInSignUpRepository {
  Future<Either<Failure, UserEntity>> signUp({SignUpEntity? entity});
  Future<Either<Failure, UserEntity>> signIn({SignInEntity? signInEntity});
}
