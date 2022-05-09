import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository.dart';
part 'social_network_controller.g.dart';

class SocialNetworkController = _SocialNetworkControllerBase
    with _$SocialNetworkController;

abstract class _SocialNetworkControllerBase with Store {
  late SignInSignUpRepository repository;

  // _SocialNetworkControllerBase({required repository});

  void setRepository({required SignInSignUpRepository repo}) =>
      repository = repo;

  Future<void> googleSignUp() async {
    // repository =
    //     Modular.get<SignInSignUpRepository>();
    var response = await repository.signUp();
    response.fold((failure) => debugPrint("Falha;"),
        (user) => debugPrint(user.toString()));
  }
}
