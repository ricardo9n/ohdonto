import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/signin_signup/presentation/routers.dart';

import '../widgets/defaul_button_widget.dart';

class SignInSignUpGetStartedPage extends StatelessWidget {
  const SignInSignUpGetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/fluorine-app-logo.png",
                scale: 2,
              ),
              Image.asset(
                "assets/images/onboarding - dentists-front.png",
                scale: 2,
              ),
              Column(
                children: [
                  const Text("Escolha uma das opções grátis"),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: width * 0.95,
                    height: height * 0.07,
                    child: DefaultButton(
                      color: Theme.of(context).primaryColor,
                      widget: const Text("Criar Conta",
                          style: TextStyle(color: Colors.white)),
                      callback: () {
                        // Navigator.pushNamed(context, toSignUpPage);
                        Modular.to.pushNamed(toSignUpPage);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: width * 0.95,
                    height: height * 0.07,
                    child: DefaultButton(
                      color: Colors.white,
                      widget: Text("Fazer Login",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      callback: () {
                        // Navigator.pushNamed(context, toSignInPage);
                        Modular.to.pushNamed(toSignInPage);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
