import 'package:flutter/material.dart';
import 'package:ohdonto/signv2/sign_in_sign_verifier_page.dart';
import 'package:ohdonto/signv2/sign_up_page.dart';

import 'teste_page.dart';

void main() {
  runApp(const OhDontoApp());
}

class OhDontoApp extends StatelessWidget {
  const OhDontoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'oh donto!',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            fontFamily: 'Euclid',
            scaffoldBackgroundColor: Colors.grey.shade100),
        //home: const MainPage(),
        //home: OnBoardingScreenWidget(),
        //home: //OnboardingPageContent(imagePath: '/assets/images/onboarding-dentist-front.png',"Pagina","Descricao"),
        //home: const StreamPageMobx()
        //home: const TestePage());
        home: const SignInSignUpVerifierPage(email: "rrgnf@ifal.edu.br"));
  }
}
