// ignore_for_file: avoid_print
import 'dart:convert';
//import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
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
    var url1 =
        'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup';
    var url2 = 'http://localhost:8082/fksignup';
    var url = Uri.parse(url2);
    print(url);

    try {
      http.Response response = await client.post(
        url,
        body: js,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*"
        },
      );
      print('recebido resp.body: '+ response.body);
      print("response decode:" + json.decode(response.body).toString());
    } on Exception catch (e) {
      print("error2: " + e.toString());
    }finally{
      client.close();
    }
  }

  Future<void> signUp2() async {
    SignUpEntity signUpEntity =
        SignUpEntity(email: email!, name: _name!, password: password!);
    String js = json.encode(signUpEntity.toMap());
    print('dados a enviar dio: $js');
    var url1 =
        'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup';
    var url2 = 'http://192.168.0.207:8081/signup';
    var dioInstance = dio.Dio();
    try {
      var response = await dioInstance.post(url1, data: js);
      print(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }
}
