import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/shared/value_failure.dart';
import 'package:ohdonto/signin_signup/datasource/signin_signup_datasource.dart';
import 'package:ohdonto/signin_signup/domain/sign_in_entity.dart';
import 'package:ohdonto/signin_signup/models/user_model.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';
import 'package:ohdonto/signin_signup/verifier/signup_code_verification_datasource.dart';
import 'package:ohdonto/signin_signup/verifier/verification_usecase.dart';

class RestDioSignupDataSource
    implements SignInSignUpDataSource, SignupCodeVerificationDatasource {
  late dio.Dio dioClient;
  //local server
  String baseUrlLocal = 'http://localhost:3000';
  //postman server
  String baseUrl = 'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io';

  RestDioSignupDataSource() {
    dioClient = dio.Dio();
  }

  @override
  Future<Either<Failure, UserModel>> signUp(SignUpEntity entity) async {
    try {
      String dadosParaEnviar = json.encode(entity.toMap());
      var url = '$baseUrl/signup';
      var response = await dioClient.post(url, data: dadosParaEnviar);
      return right(UserModel.fromMap(response.data));
    } on Exception {
      return left(Failure(errorMessage: "error!"));
      // rethrow;
    }
  }

  @override
  Future<Either<Failure, bool>> verifySignUpCode(VerificationCodeParam param) {
    return _verifySignUpCodeServerMock(param);
  }

  // ignore: unused_element
  Future<Either<Failure, bool>> _verifySignUpCodeServer(
      VerificationCodeParam param) async {
    String url = '$baseUrl/signup/verify';
    debugPrint('rest data source...'); //todo
    try {
      await dioClient
          .post(url, data: {'code': param.code, 'email': param.email});
      return right(true);
    } on dio.DioError catch (e) {
      String erroMessage = "erro no servidor: ${e.response?.data['message']}";
      return left(VerificationCodeNotMatchFailure(errorMessage: erroMessage));
    }
  }

  Future<Either<Failure, bool>> _verifySignUpCodeServerMock(
      VerificationCodeParam param) async {
    String url = '$baseUrl/signup/verify';
    debugPrint('rest data source...'); //todo
    try {
      await dioClient
          .post(url, data: {'code': param.code, 'email': param.email});
      return right(true);
    } on dio.DioError catch (e) {
      String erroMessage = "erro no servidor: ${e.response?.data['message']}";
      return left(VerificationCodeNotMatchFailure(errorMessage: erroMessage));
    }
  }

  // ignore: unused_element
  Future<Either<Failure, bool>> _verifySignUpCodeLocalMock(
      VerificationCodeParam param) async {
    debugPrint('local data source: vou esperar 1 segundo...'); //todo
    return await Future.delayed(const Duration(seconds: 1), () {
      if (param.code.length == 4 && param.code == '1234') {
        return right(true); //todo: fazer a verificação.
      } else if (param.code.length == 4 && param.code == '1233') {
        return right(false); //todo: fazer a verificação.
      }
      return left(
          VerificationCodeNotMatchFailure(errorMessage: "Codigo invalido"));
    });
  }

  @override
  Future<Either<Failure, UserModel>> signIn(SignInEntity entity) async {
    try {
      String? email = entity.email.value.fold((l) => null, (r) => r);
      String? password = entity.password.value.fold((l) => null, (r) => r);

      var response = await dioClient.post(
        '$baseUrl/signin',
        data: json.encode(
          {'email': email, 'password': password},
        ),
      );

      return right(UserModel.fromMap(response.data));
    } on dio.DioError catch (e) {
      return left(
          UserCredentialsNotMatch(errorMessage: e.response?.data['message']));
    }
  }
}
