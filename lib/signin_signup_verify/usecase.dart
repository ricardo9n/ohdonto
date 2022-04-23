import 'package:ohdonto/signin_signup_verify/signup_verification_repository.dart';

abstract class Usecase<TReturn, TParam> {
  Future<TReturn> call(TParam? param);
}
