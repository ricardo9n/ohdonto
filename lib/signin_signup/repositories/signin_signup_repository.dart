import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart'
    show SignUpEntity;
import 'package:ohdonto/signin_signup/domain/user_entity.dart' show UserEntity;

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp({SignUpEntity? entity});
  // Future<UserEntity> signIn(SignInCredentialEntity? signInEntity);
}
