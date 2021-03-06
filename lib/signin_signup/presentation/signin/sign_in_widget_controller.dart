import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/shared/failure.dart';
import 'package:ohdonto/shared/value_validators.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/presentation/signin/sign_in_usecase.dart';

import 'form_based_sign_in_usecase.dart';
part 'sign_in_widget_controller.g.dart';

class SignInWidgetController = _SignInWidgetControllerBase
    with _$SignInWidgetController;

abstract class _SignInWidgetControllerBase with Store {
  // late SignInSignUpRepository repository;
  late SignInUsecase usecase;

  _SignInWidgetControllerBase({required this.usecase});

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isVisible = false;

  @observable
  ObservableFuture<Either<Failure, UserEntity>>? signInObsFut;

  @observable
  String? signInErrorMessage;

  @observable
  bool? signInSuccess;

  @observable
  UserEntity? userEntity;

  void setEmail(String email) => this.email = email;

  void setPassword(String password) => this.password = password;

  void setIsVisible() => isVisible = !isVisible;

  @computed
  bool get isValidEmail => email == null || validateEmail(email!).isRight();

  @computed
  bool get isValidPassword =>
      password == null || validatePassword(password!).isRight();

  @computed
  String? get emailErrorMessage => email == null
      ? null
      : validateEmail(email!).fold((l) => l.errorMessage, (r) => null);

  @computed
  String? get passwordErrorMessage => password == null
      ? null
      : validatePassword(password!).fold((l) => l.errorMessage, (r) => null);

  @computed
  bool get isFormValid =>
      email != null && isValidEmail && password != null && isValidPassword;

  // void setDataSource(SignInSignUpDataSource datasource) {
  //   repository = SignInSignUpRepositoryImpl(datasource: datasource);
  // }

  Future<void> signIn() async {
    UserSignInCredentialParam param =
        UserSignInCredentialParam(email: email!, password: password!);

    // SignInUsecase usecase = FormBasedSignInUsecase(repository: repository);

    usecase = Modular.get<FormBasedSignInUsecase>();
    signInObsFut = ObservableFuture(usecase(param: param));

    var response = await signInObsFut;

    response?.fold((failure) {
      signInErrorMessage = null;
      signInErrorMessage = failure.errorMessage;
    }, (userEntity) => this.userEntity = userEntity);
  }
}
