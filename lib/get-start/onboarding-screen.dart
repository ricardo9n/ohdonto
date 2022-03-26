import 'package:flutter/material.dart';
import 'package:ohdonto/get-start/onboarding-screen-controller.dart';

class OnBoardingScreenWidget extends StatelessWidget {
  PageController obsController = PageController();
  late Size pageSize;
  OnBoardingScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: PageView(
        controller: obsController,
        children: [
          _buildPage(),
          _buildPage(),
          _buildPage(),
        ],
      ),
    ));
  }

  Widget _buildPage() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBackButton(),
          _buildJumpText(),
        ],
      ),
      Image.asset(
        'assets/images/onboarding-dentists-front.png',
        width: pageSize.width * 0.8,
        height: pageSize.width * 0.8,
      ),
      const Text("Seja encontrado por novos pacientes próximos a você!",
          style: TextStyle()),
      const Text("descrição", style: TextStyle()),
    ]);
  }

  Text _buildJumpText() {
    return const Text(
      "Pular",
      style: TextStyle(fontSize: 24),
    );
  }

  Widget _buildBackButton() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.arrow_back),
    );
  }
}
