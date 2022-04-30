import 'package:ohdonto/shared/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup/datasource/signin_datasource.dart';
import 'package:ohdonto/signin_signup/datasource/signup_datasource.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository.dart';

class SignInSignUpRepositoryImpl implements SignInSignUpRepository {
  SignUpDataSource? signUpDataSource;
  SignInDataSource? signInDataSource;

  SignInSignUpRepositoryImpl({this.signUpDataSource, this.signInDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUp({SignUpEntity? entity}) async {
    var response = await signUpDataSource?.signUp(entity!);

    return response!.fold(
        (f) => left(f),
        (userEntity) => right(UserEntity(
            id: userEntity.id,
            name: userEntity.name,
            email: userEntity.email,
            photoUrl: userEntity.photoUrl)));
  }

  @override
  Future<Either<Failure, UserEntity>> signIn({SignInEntity? signInEntity}) {
    throw UnimplementedError();
  }
}
