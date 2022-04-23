import 'package:dartz/dartz.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart';

abstract class SignUpVerificationRepository<TReturn, TParam> {
  TReturn verifySignUpCode(TParam param);
}
