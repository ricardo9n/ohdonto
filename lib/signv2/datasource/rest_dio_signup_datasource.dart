import 'dart:convert';

import 'package:dio/dio.dart' as dio;

import 'package:ohdonto/signv2/datasource/signup_datasource.dart';
import 'package:ohdonto/signv2/models/user_model.dart';
import 'package:ohdonto/signv2/domain/sign_up_entity.dart';

class RestDioSignupDataSource implements SignUpDataSource {
  late dio.Dio client;

  RestDioSignupDataSource() {
    client = dio.Dio();
  }

  @override
  Future<UserModel> signUp(SignUpEntity entity) async {
    try {
      String dadosParaEnviar = json.encode(entity.toMap());
      //'http://localhost:8082/fksignup';
      var url =
          'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup';

      var response = await client.post(url, data: dadosParaEnviar);
      return UserModel.fromMap(response.data);
    } on Exception {
      rethrow;
    }
  }
}
