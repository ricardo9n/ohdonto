import 'package:mobx/mobx.dart';
part 'stream_page_controller_mobx.g.dart';

class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {
  @observable
  bool isChecked = false;

  @observable
  String name = "";

  @action
  void check(bool isChecked) {
    this.isChecked = isChecked;
  }

  @action
  void changeName(String name) {
    this.name = name;
  }
}
