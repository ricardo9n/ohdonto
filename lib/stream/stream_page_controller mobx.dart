import 'package:mobx/mobx.dart';
part 'stream_page_controller mobx.g.dart';

class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {
  @observable
  bool isChecked = false;

  @action
  void check(bool isChecked) {
    this.isChecked = isChecked;
  }
}
