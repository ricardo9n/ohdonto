import 'package:ohdonto/sign/local_storage_signin_signup_repository.dart';
import 'package:ohdonto/sign/sign_in_credential_entity.dart';
import 'package:ohdonto/sign/sign_in_sign_up_repository.dart';
import 'package:ohdonto/sign/sign_up_credential_entity.dart';
import 'package:ohdonto/sign/user_entity.dart';
import 'package:rxdart/rxdart.dart';

class SignInSignUpController {
  final BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passController = BehaviorSubject<String>();

  SignInSignUpRepository repository = LocalStorageSignInSignUpRepository();

  ValueStream<String> get nameStream => _nameController.stream;
  Function(String) get addName => _nameController.sink.add;

  ValueStream<String> get emailStream => _emailController.stream;
  Function(String) get addEmail => _emailController.sink.add;

  ValueStream<String> get passStream => _passController.stream;
  void addPass(pass) => _passController.sink.add(pass);

  //password visibility TODO

  Future<void> sendData() async {
    print(_nameController.hasValue);
    print(_emailController.hasValue);
    print(_passController.hasValue);

/*     if ((_nameController.hasValue) &&
        (_emailController.hasValue) &&
        (_passController.hasValue)) {
      UserEntity user = await repository.signUp(SignUpCredentialEntity(
          email: _emailController.value,
          name: _nameController.value,
          password: _passController.value));
      print('user entity $user');
    } else {
      print('sendData > no datah');
    }
 */

    UserEntity user = await repository.signIn(null);
    print('sendData > sign in > $user');
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
  }
}
