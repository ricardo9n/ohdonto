import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ohdonto/shared/failure.dart';

import 'package:ohdonto/signin_signup/datasource/signin_signup_datasource.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/models/user_model.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';

class GoogleSignUpDataSource implements SignInSignUpDataSource {
  late GoogleSignIn _googleSignIn;

  GoogleSignUpDataSource() {
    _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
  }

  @override
  Future<Either<Failure, UserModel>> signUp(SignUpEntity entity) async {
    GoogleSignInAccount? account = await _googleSignIn.signIn();

    debugPrint('${account?.displayName}');

    if (account == null) {
      return left(Failure(errorMessage: "Error ao fazer login"));
    } else {
      return right(
        UserModel(
          id: account.id,
          name: account.displayName!,
          email: account.email,
          photoUrl: account.photoUrl,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn(SignInEntity entity) {
    throw UnimplementedError();
  }
}
