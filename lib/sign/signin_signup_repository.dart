//signin_signup_repository

import 'package:ohdonto/sign/sign_in_credential_entity.dart';
import 'package:ohdonto/sign/credential_entity.dart';
import 'package:ohdonto/sign/sign_up_repository.dart';
import 'package:ohdonto/sign/user_entity.dart';

class LocalStorageSignInSignUpRepository implements SignUpRepository {

  @override
  Future<UserEntity> signIn(SignInCredentialEntity signInEntity) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signUp(SignUpCredentialEntity credentialEntity) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
 