import 'package:ohdonto/signv2/datasource/signup_datasource.dart';
import 'package:ohdonto/signv2/domain/user_entity.dart';
import 'package:ohdonto/signv2/domain/sign_up_entity.dart';
import 'package:ohdonto/signv2/models/user_model.dart';
import 'package:ohdonto/signv2/repositories/signin_signup_repository.dart';

class SigninSignupRepositoryImpl implements SignInSignUpRepository {
  SignUpDataSource dataSource;

  SigninSignupRepositoryImpl({required this.dataSource});

  @override
  Future<UserEntity> signUp(SignUpEntity? entity) async {
    UserModel userModel = await dataSource.signUp(entity!);
    return UserEntity(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        photoUrl: userModel.photoUrl);
  }
}
