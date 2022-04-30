import 'package:ohdonto/shared/failure.dart';

abstract class ValueFailure extends Failure {
  //String errorMessage;

  ValueFailure({required errorMessage}) : super(errorMessage: errorMessage);

  @override
  String toString() => 'errorMessage: $errorMessage';
}

class EmailFailure extends ValueFailure {
  EmailFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class PasswordFailure extends ValueFailure {
  PasswordFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
