import 'dart:async';
import 'dart:convert';

import 'package:ohdonto/signv2/domain/sign_in_credential_entity.dart';
import 'package:ohdonto/signv2/domain/sign_up_entity.dart';
import 'package:ohdonto/signv2/sign_in_sign_up_repository.dart';
import 'package:ohdonto/signv2/domain/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSignInSignUpRepository implements SignInSignUpRepository {
  final String key = 'userEntity';
  late SharedPreferences instance;
  late Completer completer;

  LocalStorageSignInSignUpRepository() {
    completer = Completer();
    completer.complete(SharedPreferences.getInstance());
  }

  @override
  Future<UserEntity> signIn(SignInCredentialEntity? signInEntity) async {
    instance = await completer.future;
    String? userStr = instance.getString(key);
    if (userStr != null) {
      Map<String, dynamic> userMap = json.decode(userStr);
      return UserEntity.fromMap(userMap);
    }

    throw Exception("Sign in error!");
  }

  @override
  Future<UserEntity> signUp(SignUpEntity signUpEntity) async {
    instance = await completer.future;
    UserEntity user =
        UserEntity(id: '1', name: signUpEntity.name, email: signUpEntity.email);
    bool saved = await instance.setString(key, json.encode(user.toMap()));
    if (saved) {
      return user;
    } else {
      throw Exception("sign up error");
    }
  }
}
