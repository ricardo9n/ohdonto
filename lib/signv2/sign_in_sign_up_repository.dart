import 'package:ohdonto/signv2/sign_up_credential_entity.dart';
import 'package:ohdonto/signv2/sign_in_credential_entity.dart';
import 'package:ohdonto/signv2/user_entity.dart';

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp(SignUpCredentialEntity credentialEntity);
  Future<UserEntity> signIn(SignInCredentialEntity? signInEntity);
}
