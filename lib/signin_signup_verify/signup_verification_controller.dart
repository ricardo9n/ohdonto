//import 'package:either_dart/either.dart' show Either;

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/signin_signup_verify/form_based_verification_usecase.dart';
import 'package:ohdonto/signin_signup_verify/verification_usecase.dart';

import '../core/failure.dart';
import 'form_based_signup_verification_repository.dart';
import 'signup_code_verification_datasource.dart';
import 'signup_verification_repository.dart';

part 'signup_verification_controller.g.dart';

class SignUpVerificationController = _SignUpVerificationControllerBase
    with _$SignUpVerificationController;

abstract class _SignUpVerificationControllerBase with Store {
  late SignUpVerificationRepository repository;

  String? _email;

  @observable
  String? field1;
  @observable
  String? field2;
  @observable
  String? field3;
  @observable
  String? field4;

  @observable
  String? verificationCodeErrorMessage;

  @observable
  Either<Failure, bool>? verificationCodeObs;

  @observable
  bool? verificationCodeResultValidation;

  @observable
  ObservableFuture<Either<Failure, bool>>? sendVerificationCodeObs;

  @action
  void setField1(String field) => field1 = field;
  @action
  void setField2(String field) => field2 = field;
  @action
  void setField3(String field) => field3 = field;
  @action
  void setField4(String field) => field4 = field;

  set email(email) => _email = email;

  @computed
  bool get isFullFilled =>
      field1 != null &&
      field1!.isNotEmpty &&
      field2 != null &&
      field2!.isNotEmpty &&
      field3 != null &&
      field3!.isNotEmpty &&
      field4 != null &&
      field4!.isNotEmpty;

  void sendVerificationCode() async {
    String userCode = "$field1$field2$field3$field4";
    VerificationUsecase usecase =
        FormBasedVerificationUsecase(repository: repository);
    VerificationCodeParam param =
        VerificationCodeParam(code: userCode, email: _email!);

    sendVerificationCodeObs = ObservableFuture(usecase(param));
    //debugPrint("verify> $userCode -> $sendVerificationCodeObs");
    verificationCodeObs = await sendVerificationCodeObs;
  }

  @action
  void setErrorMessage() {
    verificationCodeObs?.fold(
        (failure) => verificationCodeErrorMessage = failure.toString(),
        (result) => verificationCodeResultValidation = result);
  }

  void setRepository(SignupCodeVerificationDatasource datasource) {
    repository = FormBasedSignUpVerificationRepository(datasource);
  }
}
