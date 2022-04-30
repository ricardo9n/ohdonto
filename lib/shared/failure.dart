class Failure {
  String errorMessage;

  Failure({required this.errorMessage});

  @override
  String toString() {
    return errorMessage;
  }
}

class InvalidCodeVerificationFailure extends Failure {
  InvalidCodeVerificationFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class VerificationCodeNotMatchFailure extends Failure {
  VerificationCodeNotMatchFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
