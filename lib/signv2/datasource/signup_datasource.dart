import 'package:ohdonto/signv2/domain/sign_up_entity.dart' show SignUpEntity;
import 'package:ohdonto/signv2/models/user_model.dart';

abstract class SignUpDataSource {
  Future<UserModel> signUp(SignUpEntity entity);
}
