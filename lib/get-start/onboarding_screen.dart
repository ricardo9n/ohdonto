import 'package:flutter/material.dart';
import 'package:ohdonto/get-start/onboarding_page_content.dart';

// ignore: must_be_immutable
class OnBoardingScreenWidget extends StatelessWidget {
  PageController obsController = PageController();
  int pageIndex = 0;
  OnBoardingScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
        controller: obsController,
        children: [
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding-dentists-front.png',
            title: "Seja encontrado por novos pacientes próximos a você!",
            description:
                "Através da nossa ferramenta de busca e localização, qualquer usuário pode encontrar seu perfil e informações da sua clínica.",
            pageController: obsController,
            pageIndex: pageIndex++,
            pagesLength: 3,
          ),
          OnboardingPageContent(
              imagePath: 'assets/images/onboarding-appointment.png',
              title: "2Seja encontrado por novos pacientes próximos a você!",
              description:
                  "Através da nossa ferramenta de busca e localização, qualquer usuário pode encontrar seu perfil e informações da sua clínica.",
              pageController: obsController,
              pageIndex: pageIndex++,
              pagesLength: 3),
          OnboardingPageContent(
            imagePath: 'assets/images/onboarding-videocall.png',
            title:
                "Você não precisa mais dar seu número de contatos aos pacientes",
            description:
                "Através da nossa ferramenta de busca e localização, qualquer usuário pode encontrar seu perfil e informações da sua clínica.",
            pageController: obsController,
            pageIndex: pageIndex++,
            pagesLength: 3,
          ),
        ],
      ),
    ));
  }
}
