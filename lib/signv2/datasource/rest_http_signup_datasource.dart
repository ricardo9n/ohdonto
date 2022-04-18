import 'dart:convert';

import 'package:http/http.dart';

import 'package:ohdonto/signv2/datasource/signup_datasource.dart';
import 'package:ohdonto/signv2/models/user_model.dart';
import 'package:ohdonto/signv2/domain/sign_up_entity.dart';

class RestHttpSignupDataSource implements SignUpDataSource {
  late Client client;

  RestHttpSignupDataSource() {
    client = Client();
  }

  @override
  Future<UserModel> signUp(SignUpEntity entity) async {
    try {
      String dados = json.encode(entity.toMap());
      //'http://localhost:8082/fksignup';
      var url = Uri.parse(
          'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup');

      Response response = await client.post(url, body: dados);
      var dadosRecebidos = json.decode(response.body);
      return UserModel.fromMap(dadosRecebidos);
    } on Exception {
      rethrow;
    }
  }
}
