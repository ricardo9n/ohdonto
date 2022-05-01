import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/shared/value_failure.dart';

import 'package:ohdonto/signin_signup/datasource/signin_signup_datasource.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/models/user_model.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';

class RestHttpSignupDataSource implements SignInSignUpDataSource {
  late Client httpClient;

  String baseUrlLocal = 'http://localhost:8082/fksignup';
  String baseUrl =
      'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup';

  RestHttpSignupDataSource() {
    httpClient = Client();
  }

  @override
  Future<Either<Failure, UserModel>> signUp(SignUpEntity entity) async {
    try {
      String dados = json.encode(entity.toMap());

      var url = Uri.parse(baseUrl + "baseUrl");

      Response response = await httpClient.post(url, body: dados);
      var dadosRecebidos = json.decode(response.body);
      return right(UserModel.fromMap(dadosRecebidos));
    } on Exception {
      // rethrow;
      return left(Failure(errorMessage: "signup error"));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn(SignInEntity entity) async {
    try {
      String? email = entity.email.value.fold((l) => null, (r) => r);
      String? password = entity.password.value.fold((l) => null, (r) => r);

      var url = Uri.parse(baseUrl + 'signin');
      String dados = json.encode({"email": email, "password": password});

      var response = await httpClient.post(url, body: dados);
      var dadosRecebidos = json.decode(response.body);

      return right(UserModel.fromMap(dadosRecebidos));
    } on ClientException catch (e) {
      return left(UserCredentialsNotMatch(errorMessage: e.message));
    }
  }
}
