import 'package:flutter/foundation.dart';
import 'package:ohdonto/signin_signup_teste/local_storage_signin_signup_repository.dart';
import 'package:ohdonto/signin_signup_teste/sign_in_sign_up_repository.dart';
import 'package:ohdonto/signin_signup_teste/sign_up_credential_entity.dart';
import 'package:ohdonto/signin_signup_teste/user_entity.dart';
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

  bool get isValidName => _nameController.value.length > 5;
  bool get isValidEmail =>
      _emailController.value.length > 5 && _emailController.value.contains("@");

  bool get isValidPasword => _passController.value.length >= 8;

  String? get nameErrorMessage => !isValidName ? 'Nome Inválido' : null;
  String? get emailErrorMessage => !isValidName ? 'Email Inválido' : null;
  String? get passErrorMessage => !isValidName ? 'Nome Inválido' : null;

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

  Future<void> sendData1() async {
    debugPrint(_nameController.hasValue.toString());
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
      debugPrint('user entity $user');
    } else {
      debugPrint('sendData > no datah');
    }
  }

  Future<void> sendData3() async {
    UserEntity user = await repository.signIn(null);
    debugPrint('sendData > sign in > $user');
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
    _repetedPassController.close();
  }
}
