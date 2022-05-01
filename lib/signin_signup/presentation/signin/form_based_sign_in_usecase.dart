import 'package:dartz/dartz.dart';
import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/shared/unexpected_error.dart';
import 'package:ohdonto/shared/value_failure.dart';
import 'package:ohdonto/shared/value_object.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/presentation/signin/sign_in_usecase.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository.dart';

class FormBasedSignInUsecase extends SignInUsecase {
  SignInSignUpRepository repository;

  FormBasedSignInUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(
      {required UserSignInCredentialParam? param}) async {
    if (param != null) {
      Email email = Email.fromString(param.email);

      if (!email.isValid()) {
        EmailFailure? emailFailure =
            email.value.fold((emailFailure) => emailFailure, (r) => null);
        return left(emailFailure!);
      }

      Password password = Password.fromString(param.password);

      if (!password.isValid()) {
        PasswordFailure? passwordFailure = password.value
            .fold((passwordFailure) => passwordFailure, (r) => null);
        return left(passwordFailure!);
      }

      return repository.signIn(
          signInEntity: SignInEntity(email: email, password: password));
    }
    throw UnexpectedError(errorMessage: 'Parâmetro inválido');
  }
}
