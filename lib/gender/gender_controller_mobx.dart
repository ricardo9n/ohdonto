import 'package:mobx/mobx.dart';

import 'genders.dart';
part 'gender_controller_mobx.g.dart';

class GenderController = _GenderControllerBase with _$GenderController;

abstract class _GenderControllerBase with Store {
  @observable
  Genders? _gender;

  Genders? gender() {
    return _gender;
  }

  @action
  void setGender(g) {
    _gender = g;
  }
}
