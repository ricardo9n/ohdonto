import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/signin_signup/presentation/get-started/signin_signup_getstarted_page.dart';

class SignInSignUpModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const SignInSignUpGetStartedPage())
      ];
}
