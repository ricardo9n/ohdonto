import 'package:dartz/dartz.dart';
import 'package:ohdonto/shared/value_failure.dart';

Either<EmailFailure, String> validateEmail(String email) {
  if (email.length > 5 && email.contains('@')) {
    return right(email);
  }

  return left(EmailFailure(errorMessage: 'Email Inválido: 5 ou @'));
}

Either<PasswordFailure, String> validatePassword(String password) {
  if (password.length >= 8) {
    return right(password);
  }

  return left(PasswordFailure(errorMessage: 'Senha inválida: menor que 8'));
}
