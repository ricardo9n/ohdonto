import 'package:either_dart/either.dart';
import 'package:mobx/mobx.dart';

import 'form_based_signup_verification_usecase.dart';
part 'form_based_signup_verification_controller.g.dart';

class FormBasedSignupVerificationController = _FormBasedSignupVerificationControllerBase
    with _$FormBasedSignupVerificationController;

abstract class _FormBasedSignupVerificationControllerBase with Store {
  @observable
  late String field1;
  @observable
  late String field2;
  @observable
  late String field3;
  @observable
  late String field4;

  @action
  void setField1(String field1) => this.field1 = field1;
  @action
  void setField2(String field2) => this.field2 = field2;
  @action
  void setField3(String field3) => this.field3 = field3;
  @action
  void setField4(String field4) => this.field4 = field4;

  Either<String, bool> verify() {
    FormBasedSignUpVerificationUsecase uc =
        FormBasedSignUpVerificationUsecase();
    return uc.callback(field1 + field2 + field3 + field4);
  }
}
