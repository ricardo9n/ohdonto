import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'signup_code_verification_datasource.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart' show Failure, VerificationCodeNotMatchFailure;

class FormBasedSignupCodeVerificationDatasource
    implements SignupCodeVerificationDatasource {
  @override
  Future<Either<Failure, bool>> verifySignUpCode(
      VerificationCodeParam param) async {
    debugPrint('data source: vou esperar 3 segundos antes de enviar...'); //todo
    return await Future.delayed(const Duration(seconds: 3), () {
      if (param.code.length == 4) {
        return right(true); //todo: fazer a verificação.
      }
      return left(
          VerificationCodeNotMatchFailure(errorMessage: "Codigo invalido"));
    });
  }
}
