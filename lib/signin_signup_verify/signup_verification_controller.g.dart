// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_verification_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpVerificationController
    on _SignUpVerificationControllerBase, Store {
  Computed<bool>? _$isFullFilledComputed;

  @override
  bool get isFullFilled =>
      (_$isFullFilledComputed ??= Computed<bool>(() => super.isFullFilled,
              name: '_SignUpVerificationControllerBase.isFullFilled'))
          .value;

  final _$field1Atom = Atom(name: '_SignUpVerificationControllerBase.field1');

  @override
  String? get field1 {
    _$field1Atom.reportRead();
    return super.field1;
  }

  @override
  set field1(String? value) {
    _$field1Atom.reportWrite(value, super.field1, () {
      super.field1 = value;
    });
  }

  final _$field2Atom = Atom(name: '_SignUpVerificationControllerBase.field2');

  @override
  String? get field2 {
    _$field2Atom.reportRead();
    return super.field2;
  }

  @override
  set field2(String? value) {
    _$field2Atom.reportWrite(value, super.field2, () {
      super.field2 = value;
    });
  }

  final _$field3Atom = Atom(name: '_SignUpVerificationControllerBase.field3');

  @override
  String? get field3 {
    _$field3Atom.reportRead();
    return super.field3;
  }

  @override
  set field3(String? value) {
    _$field3Atom.reportWrite(value, super.field3, () {
      super.field3 = value;
    });
  }

  final _$field4Atom = Atom(name: '_SignUpVerificationControllerBase.field4');

  @override
  String? get field4 {
    _$field4Atom.reportRead();
    return super.field4;
  }

  @override
  set field4(String? value) {
    _$field4Atom.reportWrite(value, super.field4, () {
      super.field4 = value;
    });
  }

  final _$verificationCodeErrorMessageAtom = Atom(
      name: '_SignUpVerificationControllerBase.verificationCodeErrorMessage');

  @override
  String? get verificationCodeErrorMessage {
    _$verificationCodeErrorMessageAtom.reportRead();
    return super.verificationCodeErrorMessage;
  }

  @override
  set verificationCodeErrorMessage(String? value) {
    _$verificationCodeErrorMessageAtom
        .reportWrite(value, super.verificationCodeErrorMessage, () {
      super.verificationCodeErrorMessage = value;
    });
  }

  final _$verificationCodeObsAtom =
      Atom(name: '_SignUpVerificationControllerBase.verificationCodeObs');

  @override
  Either<Failure, bool>? get verificationCodeObs {
    _$verificationCodeObsAtom.reportRead();
    return super.verificationCodeObs;
  }

  @override
  set verificationCodeObs(Either<Failure, bool>? value) {
    _$verificationCodeObsAtom.reportWrite(value, super.verificationCodeObs, () {
      super.verificationCodeObs = value;
    });
  }

  final _$sendVerificationCodeObsAtom =
      Atom(name: '_SignUpVerificationControllerBase.sendVerificationCodeObs');

  @override
  ObservableFuture<Either<Failure, bool>>? get sendVerificationCodeObs {
    _$sendVerificationCodeObsAtom.reportRead();
    return super.sendVerificationCodeObs;
  }

  @override
  set sendVerificationCodeObs(ObservableFuture<Either<Failure, bool>>? value) {
    _$sendVerificationCodeObsAtom
        .reportWrite(value, super.sendVerificationCodeObs, () {
      super.sendVerificationCodeObs = value;
    });
  }

  final _$_SignUpVerificationControllerBaseActionController =
      ActionController(name: '_SignUpVerificationControllerBase');

  @override
  void setField1(String field) {
    final _$actionInfo = _$_SignUpVerificationControllerBaseActionController
        .startAction(name: '_SignUpVerificationControllerBase.setField1');
    try {
      return super.setField1(field);
    } finally {
      _$_SignUpVerificationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setField2(String field) {
    final _$actionInfo = _$_SignUpVerificationControllerBaseActionController
        .startAction(name: '_SignUpVerificationControllerBase.setField2');
    try {
      return super.setField2(field);
    } finally {
      _$_SignUpVerificationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setField3(String field) {
    final _$actionInfo = _$_SignUpVerificationControllerBaseActionController
        .startAction(name: '_SignUpVerificationControllerBase.setField3');
    try {
      return super.setField3(field);
    } finally {
      _$_SignUpVerificationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setField4(String field) {
    final _$actionInfo = _$_SignUpVerificationControllerBaseActionController
        .startAction(name: '_SignUpVerificationControllerBase.setField4');
    try {
      return super.setField4(field);
    } finally {
      _$_SignUpVerificationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
field1: ${field1},
field2: ${field2},
field3: ${field3},
field4: ${field4},
verificationCodeErrorMessage: ${verificationCodeErrorMessage},
verificationCodeObs: ${verificationCodeObs},
sendVerificationCodeObs: ${sendVerificationCodeObs},
isFullFilled: ${isFullFilled}
    ''';
  }
}
