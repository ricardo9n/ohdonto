import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/shared/topbar_backbutton_widget.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/presentation/signin/sign_in_widget_controller.dart';
import 'package:ohdonto/signin_signup/presentation/signin_signup_base_page.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/defaul_button_widget.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/social_network_widget.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/text_field_widget.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/title_widget.dart';

import '../routers.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late SignInWidgetController controller;

  late ReactionDisposer singInErrorMessageDisposer;
  late ReactionDisposer singInSuccessDisposer;

  @override
  void initState() {
    super.initState();

    // controller = SignInWidgetController();
    // controller.setDataSource(RestDioSignupDataSource());
    controller = Modular.get<SignInWidgetController>();

    singInErrorMessageDisposer = reaction(
        (_) => controller.signInErrorMessage, handleSignInErrorMessage);

    singInSuccessDisposer =
        reaction((_) => controller.userEntity, handleSignInSuccess);
  }

  @override
  void dispose() {
    singInErrorMessageDisposer();
    singInSuccessDisposer();
    super.dispose();
  }

  void handleSignInErrorMessage(String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message!)));
  }

  void handleSignInSuccess(UserEntity? userEntity) {
    // Navigator.pushNamed(context, toMainPage, arguments: userEntity);

    Modular.to.pushNamed(toMainPage, arguments: userEntity);
  }

  @override
  Widget build(BuildContext context) {
    double formWidth = MediaQuery.of(context).size.width;

    return SignInSignUpBasePage(
      child: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopbarBackButtonWidget(),
            const TitleWidget(titleList: ['Fazer', 'Login']),
            TextFieldWidget(
              width: formWidth,
              label: 'Email',
              maxLength: 50,
              inputType: TextInputType.emailAddress,
              errorText: controller.emailErrorMessage,
              onChangedCallback: controller.setEmail,
            ),
            TextFieldWidget(
              width: formWidth,
              label: 'Senha',
              maxLength: 20,
              inputType: TextInputType.text,
              errorText: controller.passwordErrorMessage,
              obscureText: controller.isVisible ? false : true,
              icon: IconButton(
                onPressed: () {
                  controller.setIsVisible();
                },
                icon: controller.isVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              onChangedCallback: controller.setPassword,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: formWidth,
              height: MediaQuery.of(context).size.height * 0.08,
              child: DefaultButton(
                color: Theme.of(context).primaryColor,
                widget: const Text(
                  "Fazer Login",
                  style: TextStyle(color: Colors.white),
                ),
                callback: controller.isFormValid
                    ? () {
                        debugPrint('Enviar dados!');
                        controller.signIn();
                      }
                    : null,
              ),
            ),
            const SizedBox(height: 30),
            const SocialNetworkWidget(),
          ],
        );
      }),
    );
  }
}
