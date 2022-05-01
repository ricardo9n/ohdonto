import 'package:ohdonto/shared/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup/datasource/signin_signup_datasource.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository.dart';

class SignInSignUpRepositoryImpl implements SignInSignUpRepository {
  SignInSignUpDataSource datasource;

  SignInSignUpRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserEntity>> signUp(
      {SignUpEntity? signUpEntity}) async {
    var response = await datasource.signUp(signUpEntity!);

    return response.fold(
        (f) => left(f),
        (userEntity) => right(UserEntity(
            id: userEntity.id,
            name: userEntity.name,
            email: userEntity.email,
            photoUrl: userEntity.photoUrl)));
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      {required SignInEntity signInEntity}) async {
    var response = await datasource.signIn(signInEntity);

    return response.fold(
        (f) => left(f),
        (userEntity) => right(UserEntity(
            id: userEntity.id,
            name: userEntity.name,
            email: userEntity.email,
            photoUrl: userEntity.photoUrl)));
  }
}
