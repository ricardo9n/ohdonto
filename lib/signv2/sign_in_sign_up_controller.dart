// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:ohdonto/signv2/domain/sign_up_entity.dart';
part 'sign_in_sign_up_controller.g.dart';

class SignInSignUpController = _SignInSignUpControllerBase
    with _$SignInSignUpController;

abstract class _SignInSignUpControllerBase with Store {
  @observable
  String? _name;
  @observable
  String? email;
  @observable
  String? password;
  @observable
  String? rePassword;

  @observable
  bool isVisiblePassField = false;

  @action
  void setName(String name) {
    _name = name;
  }

  @action
  void setEmail(String email) {
    this.email = email;
  }

  @action
  void setPassword(String password) {
    this.password = password;
  }

  @action
  void setRePassword(String rePassword) {
    this.rePassword = rePassword;
  }

  @action
  void changePassFieldVisibility() {
    isVisiblePassField = !isVisiblePassField;
  }

  @computed
  bool get isValidName => _name == null || _name!.length > 3;
  @computed
  bool get isValidEmail =>
      email == null || (email!.length > 3 && email!.contains("@"));
  @computed
  bool get isValidPassword => password == null || password!.length > 3;

  @computed
  String? get nameErrorMessage => !isValidName ? "Nome inválido" : null;
  @computed
  String? get emailErrorMessage => !isValidEmail ? "Email inválido" : null;
  @computed
  String? get passwordErrorMsg => !isValidPassword ? "Senha inválida" : null;

  @computed
  bool get isPassEqual =>
      password == rePassword; //password != null && TODO: check

  @computed
  bool get isFormValid =>
      _name != null &&
      password != null &&
      email != null &&
      isValidName &&
      isValidEmail &&
      isValidPassword &&
      isPassEqual;

  Future<void> signUp1() async {
    SignUpEntity signUpEntity =
        SignUpEntity(email: email!, name: _name!, password: password!);
    var client = http.Client();
    String js = json.encode(signUpEntity.toMap());
    print('dados a enviar: $js');
    var response;
    try {
      response = await client.post(
        Uri.parse('http://localhost:8081/signup'),
        body: js,
        headers: {'Content-type': 'application/json'},
      );
    } on Exception catch (e) {
      print(e.toString());
    }
    try {
      print("response:\n" + json.decode(response.body));
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> signUp2() async {
    SignUpEntity signUpEntity =
        SignUpEntity(email: email!, name: _name!, password: password!);
    String js = json.encode(signUpEntity.toMap());
    print('dados a enviar dio: $js');
    Dio dio = Dio();
    try {
      var response = await dio.post('http://localhost:8081/signup', data: js);
      print(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }
}
