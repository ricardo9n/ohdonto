// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_controller_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenderController on _GenderControllerBase, Store {
  final _$_genderAtom = Atom(name: '_GenderControllerBase._gender');

  @override
  Genders? get _gender {
    _$_genderAtom.reportRead();
    return super._gender;
  }

  @override
  set _gender(Genders? value) {
    _$_genderAtom.reportWrite(value, super._gender, () {
      super._gender = value;
    });
  }

  final _$_GenderControllerBaseActionController =
      ActionController(name: '_GenderControllerBase');

  @override
  void setGender(dynamic g) {
    final _$actionInfo = _$_GenderControllerBaseActionController.startAction(
        name: '_GenderControllerBase.setGender');
    try {
      return super.setGender(g);
    } finally {
      _$_GenderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
