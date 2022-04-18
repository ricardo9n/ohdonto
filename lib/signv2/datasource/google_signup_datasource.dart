import 'package:google_sign_in/google_sign_in.dart';

import 'package:ohdonto/signv2/datasource/signup_datasource.dart';
import 'package:ohdonto/signv2/models/user_model.dart';
import 'package:ohdonto/signv2/domain/sign_up_entity.dart';

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
    print('${account?.displayName}');
    return UserModel(
        id: account!.id,
        name: account.displayName!,
        email: account.email,
        photoUrl: account.photoUrl);
  }
}
