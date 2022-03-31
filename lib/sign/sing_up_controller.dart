import 'package:rxdart/rxdart.dart';

class SingUpController {
  BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  BehaviorSubject<String> _passController = BehaviorSubject<String>();

  ValueStream<String> get nameStream => _nameController.stream;
  Function(String) get addName => _nameController.sink.add;

  ValueStream<String> get emailStream => _emailController.stream;
  Function(String) get addEmail => _emailController.sink.add;

  ValueStream<String> get passStream => _passController.stream;
  void addPass(pass) => _nameController.sink.add(pass);

  //password visibility TODO

  void sendData() {
    print(_nameController.hasValue);
    print(_emailController.hasValue);
    print(_passController.hasValue);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passController.close();
  }
}
