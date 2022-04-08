import 'package:ohdonto/signv2/domain/sign_up_entity.dart';
import 'package:ohdonto/signv2/domain/sign_in_credential_entity.dart';
import 'package:ohdonto/signv2/domain/user_entity.dart';

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp(SignUpEntity credentialEntity);
  Future<UserEntity> signIn(SignInCredentialEntity? signInEntity);
}
