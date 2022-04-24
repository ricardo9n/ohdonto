import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ohdonto/signin_signup/datasource/signup_datasource.dart';
import 'package:ohdonto/signin_signup/models/user_model.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';

class GoogleSignUpDataSource implements SignUpDataSource {
  late GoogleSignIn _googleSignIn;

  GoogleSignUpDataSource() {
    _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
  }

  @override
  Future<UserModel> signUp(SignUpEntity entity) async {
    GoogleSignInAccount? account = await _googleSignIn.signIn();
    debugPrint('${account?.displayName}');
    return UserModel(
        id: account!.id,
        name: account.displayName!,
        email: account.email,
        photoUrl: account.photoUrl);
  }
}
