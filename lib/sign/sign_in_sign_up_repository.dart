import 'package:ohdonto/sign/sign_up_credential_entity.dart';
import 'package:ohdonto/sign/sign_in_credential_entity.dart';
import 'package:ohdonto/sign/user_entity.dart';

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp(SignUpCredentialEntity credentialEntity);
  Future<UserEntity> signIn(SignInCredentialEntity? signInEntity);
}
