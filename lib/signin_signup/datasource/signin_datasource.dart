import 'package:dartz/dartz.dart';
import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/models/user_model.dart';

abstract class SignInDataSource {
  Future<Either<Failure, UserModel>> signIn(SignInEntity entity);
}
