import 'package:mobx/mobx.dart';

import 'package:ohdonto/signin_signup/domain/sign_up_entity.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignInSignUpControllerBase with _$SignUpController;

abstract class _SignInSignUpControllerBase with Store {
  late SignInSignUpRepository repository;

  _SignInSignUpControllerBase({required this.repository});

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

  @observable
  UserEntity? userEntity;

  @observable
  String? signUpErrorMessage;

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
  bool get isPassEqual => password == rePassword; //password != null &&

  @computed
  bool get isFormValid =>
      _name != null &&
      password != null &&
      email != null &&
      isValidName &&
      isValidEmail &&
      isValidPassword &&
      isPassEqual;

  // void setSignUpStrategy(SignInSignUpDataSource dataSource1) {
  //   repository = SignInSignUpRepositoryImpl(datasource: dataSource1);
  // }

  Future<void> signUp() async {
    // repository = Modular.get<SignInSignUpRepository>();

    SignUpEntity signUpEntity1 = SignUpEntity(
      email: email!,
      name: _name!,
      password: password!,
    );
    var response = await repository.signUp(signUpEntity: signUpEntity1);

    response.fold((failure) => signUpErrorMessage = failure.errorMessage,
        (user) => userEntity = user);
  }
}
