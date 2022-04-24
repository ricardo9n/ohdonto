import 'package:ohdonto/signin_signup_teste/sign_up_credential_entity.dart';
import 'package:ohdonto/signin_signup_teste/sign_in_credential_entity.dart';
import 'package:ohdonto/signin_signup_teste/user_entity.dart';

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp(SignUpCredentialEntity credentialEntity);
  Future<UserEntity> signIn(SignInCredentialEntity? signInEntity);
}
