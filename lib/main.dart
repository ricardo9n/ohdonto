import 'package:flutter/material.dart';
import 'package:ohdonto/sign/sign_up_page.dart';
import 'package:ohdonto/stream/stream_page.dart';
import 'package:ohdonto/stream/stream_page_mobx.dart';

import 'gender/gender_page.dart';
import 'onboarding/onboarding_page_content.dart';
import 'onboarding/onboarding_screen.dart';

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
        home: SignUpPage());
  }
}
