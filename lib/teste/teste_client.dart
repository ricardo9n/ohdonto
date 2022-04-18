import 'dart:convert';

// import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

Future<void> signUp1() async {
  var dados = {'name': 'teste jr', 'email': 'teste@teste', 'password': '1234'};
  var client = http.Client();
  String js = json.encode(dados);
  // print('dados a enviar: $js');
  var url = Uri.parse(
      'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup');
  // var url2 = 'http://localhost:8082/fksignup';

  try {
    http.Response response = await client.post(
      url,
      body: js,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*"
      },
    );
    response.isRedirect;
    // print('recebido resp.body: ' + response.body);
    // print("response decode:" + json.decode(response.body).toString());
  } on Exception {
    rethrow;
    // print("error2: " + e.toString());
  } finally {
    client.close();
  }
}

Future<void> signUp2() async {
  // var dados = {'name': 'test2 jr', 'email': 'teste@teste', 'password': '1234'};
  // String js = json.encode(dados);
  // // print('dados a enviar dio: $js');
  // var url1 =
  //     'https://18b78dbc-7093-4474-a016-08a46285ce99.mock.pstmn.io/signup';
  // var url2 = 'http://192.168.0.207:8081/signup';
  // var dioInstance = dio.Dio();
  // try {
  //   // var response = await dioInstance.post(url1, data: js);
  //   // print('r.data: ' + response.data);
  // } on Exception {
  //   // print(e);
  // }
}

void main() {
  signUp1();
  signUp2();
}
