// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ohdonto/shared/unexpected_error.dart';
import 'package:ohdonto/shared/value_failure.dart';
import 'package:ohdonto/shared/value_validators.dart';

abstract class ValueObject<T> extends Equatable {
  Either<ValueFailure, T> get value;

  bool isValid() => value.isRight();

  T getOrCrash() {
    return value.fold(
        (l) => throw UnexpectedError(errorMessage: "valor inconsistente"),
        (r) => r);
  }

  @override
  List<Object?> get props => [value];
}

class Email extends ValueObject<String> {
  @override
  Either<EmailFailure, String> value; // => throw UnimplementedError();

  Email._(this.value);

  factory Email.fromString(String email) {
    return Email._(validateEmail(email));
  }
}

class Password extends ValueObject<String> {
  @override
  Either<PasswordFailure, String> value;

  Password._(this.value);

  factory Password.fromString(String password) {
    return Password._(validatePassword(password));
  }
}
