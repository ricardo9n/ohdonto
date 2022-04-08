import 'package:mobx/mobx.dart';
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

  @action
  void setName(String name) {
    _name = name;
  }

  @action
  void setEmail(String email) {
    print("controller.setEmail($email)");
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

  @computed
  bool get isValidName => _name != null && _name!.length > 5;
  @computed
  bool get isValidEmail =>
      email != null && email!.length > 5 && email!.contains("@");
  @computed
  bool get isValidPassword => password != null && password!.length > 8;

  @computed
  String? get nameErrorMessage => !isValidName ? "Nome inválido" : null;
  @computed
  String? get emailErrorMessage => !isValidEmail ? "Email inválido" : null;
  @computed
  String? get passwordErrorMsg => !isValidPassword ? "Senha inválida" : null;

  @computed
  bool get isPassEqual => password == rePassword; //password != null &&
}
