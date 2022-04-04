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
  final BehaviorSubject<String> _repetedPassController =
      BehaviorSubject<String>();
  final BehaviorSubject<bool> _buttonController = BehaviorSubject<bool>();
  final BehaviorSubject<bool> _textStatusController = BehaviorSubject<bool>();

  SignInSignUpRepository repository = LocalStorageSignInSignUpRepository();

  ValueStream<String> get nameStream => _nameController.stream;
  Function(String) get addName => _nameController.sink.add;

  ValueStream<String> get emailStream => _emailController.stream;
  Function(String) get addEmail => _emailController.sink.add;

  ValueStream<String> get passStream => _passController.stream;
  void addPass(pass) {
    _passController.sink.add(pass);
    notfyAboutPass();
  }

  ValueStream<String> get repetedPassStream => _repetedPassController.stream;
  void addRepetedPass(pass) {
    _repetedPassController.sink.add(pass);
    notfyAboutPass();
  }

  void notfyAboutPass() {
    if (hasPass()) {
      sendButtonStatus(isSamePass());
      sendTextStatus(!isSamePass());
    } else {
      sendTextStatus(false);
    }
  }

  ValueStream<bool> get buttonStream => _buttonController.stream;
  void sendButtonStatus(status) {
    _buttonController.sink.add(status);
  }

  ValueStream<bool> get textStatusStream => _textStatusController.stream;
  void sendTextStatus(status) {
    _textStatusController.sink.add(status);
  }

  bool hasPass() {
    return _passController.hasValue &&
        _repetedPassController.hasValue &&
        _passController.value != '';
  }

  bool isSamePass() {
    return (_passController.value == _repetedPassController.value);
  }

  //password visibility TODO

  Future<void> sendData1() async {
    print(_nameController.hasValue);
    print(_emailController.hasValue);
    print(_passController.hasValue);
    print(_repetedPassController.hasValue);
  }

  Future<void> sendData2() async {
    if ((_nameController.hasValue) &&
        (_emailController.hasValue) &&
        (_passController.hasValue)) {
      var signUpCredentialEntity = SignUpCredentialEntity(
          email: _emailController.value,
          name: _nameController.value,
          password: _passController.value);
      UserEntity user = await repository.signUp(signUpCredentialEntity);
      print('user entity $user');
    } else {
      print('sendData > no datah');
    }
  }

  Future<void> sendData3() async {
    UserEntity user = await repository.signIn(null);
    print('sendData > sign in > $user');
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _repetedPassController.close();
  }
}
