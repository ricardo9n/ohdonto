// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignInSignUpControllerBase, Store {
  Computed<bool>? _$isValidNameComputed;

  @override
  bool get isValidName =>
      (_$isValidNameComputed ??= Computed<bool>(() => super.isValidName,
              name: '_SignInSignUpControllerBase.isValidName'))
          .value;
  Computed<bool>? _$isValidEmailComputed;

  @override
  bool get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<bool>(() => super.isValidEmail,
              name: '_SignInSignUpControllerBase.isValidEmail'))
          .value;
  Computed<bool>? _$isValidPasswordComputed;

  @override
  bool get isValidPassword =>
      (_$isValidPasswordComputed ??= Computed<bool>(() => super.isValidPassword,
              name: '_SignInSignUpControllerBase.isValidPassword'))
          .value;
  Computed<String?>? _$nameErrorMessageComputed;

  @override
  String? get nameErrorMessage => (_$nameErrorMessageComputed ??=
          Computed<String?>(() => super.nameErrorMessage,
              name: '_SignInSignUpControllerBase.nameErrorMessage'))
      .value;
  Computed<String?>? _$emailErrorMessageComputed;

  @override
  String? get emailErrorMessage => (_$emailErrorMessageComputed ??=
          Computed<String?>(() => super.emailErrorMessage,
              name: '_SignInSignUpControllerBase.emailErrorMessage'))
      .value;
  Computed<String?>? _$passwordErrorMsgComputed;

  @override
  String? get passwordErrorMsg => (_$passwordErrorMsgComputed ??=
          Computed<String?>(() => super.passwordErrorMsg,
              name: '_SignInSignUpControllerBase.passwordErrorMsg'))
      .value;
  Computed<bool>? _$isPassEqualComputed;

  @override
  bool get isPassEqual =>
      (_$isPassEqualComputed ??= Computed<bool>(() => super.isPassEqual,
              name: '_SignInSignUpControllerBase.isPassEqual'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignInSignUpControllerBase.isFormValid'))
          .value;

  final _$_nameAtom = Atom(name: '_SignInSignUpControllerBase._name');

  @override
  String? get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String? value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignInSignUpControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignInSignUpControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$rePasswordAtom = Atom(name: '_SignInSignUpControllerBase.rePassword');

  @override
  String? get rePassword {
    _$rePasswordAtom.reportRead();
    return super.rePassword;
  }

  @override
  set rePassword(String? value) {
    _$rePasswordAtom.reportWrite(value, super.rePassword, () {
      super.rePassword = value;
    });
  }

  final _$isVisiblePassFieldAtom =
      Atom(name: '_SignInSignUpControllerBase.isVisiblePassField');

  @override
  bool get isVisiblePassField {
    _$isVisiblePassFieldAtom.reportRead();
    return super.isVisiblePassField;
  }

  @override
  set isVisiblePassField(bool value) {
    _$isVisiblePassFieldAtom.reportWrite(value, super.isVisiblePassField, () {
      super.isVisiblePassField = value;
    });
  }

  final _$_SignInSignUpControllerBaseActionController =
      ActionController(name: '_SignInSignUpControllerBase');

  @override
  void setName(String name) {
    final _$actionInfo = _$_SignInSignUpControllerBaseActionController
        .startAction(name: '_SignInSignUpControllerBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_SignInSignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_SignInSignUpControllerBaseActionController
        .startAction(name: '_SignInSignUpControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignInSignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_SignInSignUpControllerBaseActionController
        .startAction(name: '_SignInSignUpControllerBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_SignInSignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRePassword(String rePassword) {
    final _$actionInfo = _$_SignInSignUpControllerBaseActionController
        .startAction(name: '_SignInSignUpControllerBase.setRePassword');
    try {
      return super.setRePassword(rePassword);
    } finally {
      _$_SignInSignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassFieldVisibility() {
    final _$actionInfo =
        _$_SignInSignUpControllerBaseActionController.startAction(
            name: '_SignInSignUpControllerBase.changePassFieldVisibility');
    try {
      return super.changePassFieldVisibility();
    } finally {
      _$_SignInSignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
rePassword: ${rePassword},
isVisiblePassField: ${isVisiblePassField},
isValidName: ${isValidName},
isValidEmail: ${isValidEmail},
isValidPassword: ${isValidPassword},
nameErrorMessage: ${nameErrorMessage},
emailErrorMessage: ${emailErrorMessage},
passwordErrorMsg: ${passwordErrorMsg},
isPassEqual: ${isPassEqual},
isFormValid: ${isFormValid}
    ''';
  }
}
