import 'package:dartz/dartz.dart';
import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart'
    show SignUpEntity;
import 'package:ohdonto/signin_signup/models/user_model.dart';

abstract class SignUpDataSource {
  Future<Either<Failure, UserModel>> signUp(SignUpEntity entity);
}
