import 'package:ohdonto/signv2/domain/sign_up_entity.dart' show SignUpEntity;
import 'package:ohdonto/signv2/domain/user_entity.dart' show UserEntity;

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp(SignUpEntity? credentialEntity);
  // Future<UserEntity> signIn(SignInCredentialEntity? signInEntity);
}
