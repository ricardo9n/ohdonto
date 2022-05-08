import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/main/main_module.dart';
import 'package:ohdonto/signin_signup/datasource/google_signup_datasource.dart';
import 'package:ohdonto/signin_signup/datasource/rest_dio_signup_datasource.dart';
import 'package:ohdonto/signin_signup/presentation/get-started/signin_signup_getstarted_page.dart';
import 'package:ohdonto/signin_signup/presentation/routers.dart';
import 'package:ohdonto/signin_signup/presentation/signin/form_based_sign_in_usecase.dart';
import 'package:ohdonto/signin_signup/presentation/signin/sign_in_widget_controller.dart';
import 'package:ohdonto/signin_signup/presentation/signup/sign_up_controller.dart';
import 'package:ohdonto/signin_signup/presentation/signup/sign_up_widget_page.dart';
import 'package:ohdonto/signin_signup/presentation/verification/signup_verification_controller.dart';
import 'package:ohdonto/signin_signup/presentation/verification/signup_verification_page.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/social_network_controller.dart';
import 'package:ohdonto/signin_signup/repositories/signin_signup_repository_impl.dart';
import 'package:ohdonto/signin_signup/verifier/form_based_verification_usecase.dart';

class SignInSignUpModule extends Module {
  @override
  List<Bind> get binds => [
        //todo - faltando ?
        Bind.singleton((i) => GoogleSignUpDataSource()),

        //signIn - //
        Bind.singleton((i) => RestDioSignupDataSource()),
        Bind.singleton((i) => SignInSignUpRepositoryImpl(datasource: i.get())),
        Bind.singleton((i) => FormBasedSignInUsecase(repository: i.get())),
        Bind.singleton((i) => SignInWidgetController(usecase: i.get())),

        //signUp
        Bind.singleton((i) => SignUpController(repository: i.get())),

        //socialnetwork
        Bind.singleton((i) => SocialNetworkController(repository: i.get())),

        //verificaton code
        Bind.singleton(
            (i) => FormBasedVerificationUsecase(repository: i.get())),
        Bind.singleton((i) => SignUpVerificationController()),
      ];

  @override
  List<Module> get imports => [
        //InfraModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const SignInSignUpGetStartedPage()),
        ChildRoute('/$toSignUpPage',
            child: (context, args) => const SignUpWidgetPage()),
        ChildRoute('/$toVerificationPage',
            child: (context, args) => SignUpVerificationPage(
                  userEntity: args.data,
                )),
        ModuleRoute('/$toMainPage', module: MainModule())
      ];
}
