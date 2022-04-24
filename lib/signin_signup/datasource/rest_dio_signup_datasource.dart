import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

import 'package:ohdonto/core/failure.dart';
import 'package:ohdonto/signin_signup/datasource/signup_datasource.dart';
import 'package:ohdonto/signin_signup/models/user_model.dart';
import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';
import 'package:ohdonto/signin_signup/verifier/signup_code_verification_datasource.dart';
import 'package:ohdonto/signin_signup/verifier/verification_usecase.dart';

class RestDioSignupDataSource
    implements SignUpDataSource, SignupCodeVerificationDatasource {
  late dio.Dio client;
  //local server
  String urlBaseLocal = 'http://localhost:3000';
  //postman server
  String urlBase = 'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io';

  RestDioSignupDataSource() {
    client = dio.Dio();
  }

  @override
  Future<UserModel> signUp(SignUpEntity entity) async {
    try {
      String dadosParaEnviar = json.encode(entity.toMap());
      var url = '$urlBase/signup';
      var response = await client.post(url, data: dadosParaEnviar);
      return UserModel.fromMap(response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<Either<Failure, bool>> verifySignUpCode(VerificationCodeParam param) {
    return _verifySignUpCodeServerMock(param);
  }

  Future<Either<Failure, bool>> _verifySignUpCodeServer(
      VerificationCodeParam param) async {
    String url = '$urlBase/signup/verify';
    debugPrint('rest data source...'); //todo
    try {
      await client.post(url, data: {'code': param.code, 'email': param.email});
      return right(true);
    } on dio.DioError catch (e) {
      String erroMessage = "erro no servidor: ${e.response?.data['message']}";
      return left(VerificationCodeNotMatchFailure(errorMessage: erroMessage));
    }
  }

  Future<Either<Failure, bool>> _verifySignUpCodeServerMock(
      VerificationCodeParam param) async {
    String url = '$urlBase/signup/verify';
    debugPrint('rest data source...'); //todo
    try {
      await client.post(url, data: {'code': param.code, 'email': param.email});
      return right(true);
    } on dio.DioError catch (e) {
      String erroMessage = "erro no servidor: ${e.response?.data['message']}";
      return left(VerificationCodeNotMatchFailure(errorMessage: erroMessage));
    }
  }

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
}
