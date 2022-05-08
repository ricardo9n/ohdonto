// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/app/pages/patient_request_widget.dart';
import 'package:ohdonto/app/pages/sigin_sigup.dart';
import 'package:ohdonto/gender_teste/gender_page.dart';
import 'package:ohdonto/get_started/onboarding_page_content.dart';
import 'package:ohdonto/get_started/onboarding_screen_page.dart';
import 'package:ohdonto/signin_signup/presentation/routers.dart';
import 'package:ohdonto/signin_signup/presentation/signin/sign_in_widget_page.dart';
import 'package:ohdonto/signin_signup/presentation/signup/sign_up_widget_page.dart';
import 'package:ohdonto/signin_signup/presentation/get-started/signin_signup_getstarted_page.dart';
import 'package:ohdonto/signin_signup/presentation/verification/signup_verification_page.dart';
import 'package:ohdonto/stream_teste/stream_page_mobx.dart';
import 'package:ohdonto/teste/teste_page.dart';

import 'app/pages/main_page.dart';
import 'app_modele.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const OhDontoApp()));
}

class OhDontoApp extends StatelessWidget {
  const OhDontoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'oh donto!',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          fontFamily: 'Euclid',
          scaffoldBackgroundColor: Colors.grey.shade100),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,

      //home: const MainPage(),
      //home: const TesteBotaoVoltarPage(),
      //home: const GenderPage(),
      //home: OnBoardingScreenWidget(),
      //home: const StreamPageMobx(),
      //home: const TestePage(),
      //home: const SignUpVerificationPage(email: "rrgnf@ifal.edu.br"),
      // home: const SignUpPage(),
      //home: const SignInSignUpGetStartedPage(),
      //home: const SignInWidget(),

      // routes: {
      //   '/': (BuildContext context) => OnBoardingScreenWidget(),
      //   toSignUpPage: (BuildContext context) => const SignUpWidgetPage(),
      //   toSignInPage: (BuildContext context) => const SignInWidget(),
      //   toMainPage: (BuildContext context) => const MainPage(),
      //   toGetStarted: (BuildContext context) =>
      //       const SignInSignUpGetStartedPage(),
      //   toVerificationPage: (BuildContext context) =>
      //       const SignUpVerificationPage(),
      // },
    );
  }
}
