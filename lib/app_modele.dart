import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/get_started/onboarding_screen_page.dart';
import 'package:ohdonto/signin_signup/signin_signup_module.dart';
import 'routes.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        //ModuleRoute('/$toGetStartedPage', module: GetStartedModule()),
        ChildRoute('/', child: (context, args) => OnBoardingScreenWidget()),
        ModuleRoute('/$toGetStartedPage', module: SignInSignUpModule()),
      ];
}
