import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository.dart';
part 'social_network_controller.g.dart';

class SocialNetworkController = _SocialNetworkControllerBase
    with _$SocialNetworkController;

abstract class _SocialNetworkControllerBase with Store {
  late SignInSignUpRepository repository;

  void setRepository(SignInSignUpRepository repo) => repository = repo;

  Future<void> googleSignUp() async {
    var response = await repository.signUp();
    response.fold((failure) => debugPrint("Falha;"),
        (user) => debugPrint(user.toString()));
  }
}
