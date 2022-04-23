//import 'package:either_dart/either.dart' show Either;

import 'package:mobx/mobx.dart';
import 'package:ohdonto/signin_signup_verify/form_based_verification_usecase.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import 'form_based_signup_verification_repository.dart';
import 'signup_code_verification_datasource.dart';
import 'signup_verification_repository.dart';

part 'signup_verification_controller.g.dart';

class SignUpVerificationController = _SignUpVerificationControllerBase
    with _$SignUpVerificationController;

abstract class _SignUpVerificationControllerBase with Store {
  late SignUpVerificationRepository repository;

  @observable
  String? g1;
  @observable
  String? g2;
  @observable
  String? g3;
  @observable
  String? g4;

  @observable
  String? errorMessage;

  @action
  void setField1(String field1) => g1 = field1;
  @action
  void setField2(String field2) => g2 = field2;
  @action
  void setField3(String field3) => g3 = field3;
  @action
  void setField4(String field4) => g4 = field4;

  @computed
  bool get isFullFilled =>
      g1 != null &&
      g1!.isNotEmpty &&
      g2 != null &&
      g2!.isNotEmpty &&
      g3 != null &&
      g3!.isNotEmpty &&
      g4 != null &&
      g4!.isNotEmpty;

  void verify() async {
    String userCode = g1! + g2! + g3! + g4!;
    VerificationUsecase usecase =
        FormBasedVerificationUsecase(repository: repository);
    VerificationCodeParam param =
        VerificationCodeParam(code: userCode, email: "email");
    var response = await usecase(param);
    response.fold(
      (failure) => errorMessage = failure.errorMessage,
      (result) => true,
    );
  }

  void setVerificationStrategy(SignupCodeVerificationDatasource datasource) {
    repository = FormBasedSignUpVerificationRepository(datasource);
  }
}
