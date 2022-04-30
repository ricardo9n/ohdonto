import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ohdonto/shared/topbar_backbutton_widget.dart';
import 'package:ohdonto/signin_signup/datasource/google_signup_datasource.dart';
import 'package:ohdonto/signin_signup/datasource/rest_http_signup_datasource.dart';
import 'package:ohdonto/signin_signup/presentation/signup/sign_up_controller.dart';
import 'package:ohdonto/signin_signup/presentation/signin_signup_base_page.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/defaul_button_widget.dart';

import '../widgets/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpController controller;

  @override
  void initState() {
    super.initState();
    controller = SignUpController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignInSignUpBasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBarWidget(),
          _buildCreateAccountText(),
          _buildForm(),
        ],
      ),
    );
  }

  Widget textTitle(String name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 40),
    );
  }

  Widget _buildCreateAccountText() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [textTitle("Criar"), textTitle("Conta")]);
  }

  void voltar() {
    Navigator.pop(context);
  }

  Widget _buildTopBarWidget() {
    return Row(
      children: [
        TopbarBackButtonWidget(callback: voltar),
        const Text('Vamos criar uma conta?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    );
  }

  Widget _buildForm() {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, top: 8),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldWidget(
                text: 'Nome',
                hint: 'Digite seu nome',
                callback: controller.setName,
                errorText: controller.nameErrorMessage,
                obscureText: false,
              ),
              TextFieldWidget(
                  text: 'Email',
                  hint: 'Digite seu Email',
                  //          stream: controller.emailStream,
                  callback: controller.setEmail,
                  errorText: controller.emailErrorMessage,
                  keyboardType: TextInputType.emailAddress),
              TextFieldWidget(
                  text: 'Senha',
                  hint: 'Digite sua senha',
                  callback: controller.setPassword,
                  errorText: controller.passwordErrorMsg,
                  obscureText: !controller.isVisiblePassField,
                  icon: IconButton(
                    icon: controller.isVisiblePassField
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: controller.changePassFieldVisibility,
                  )),
              TextFieldWidget(
                text: 'Confirmação de Senha',
                hint: 'Digite novamente sua senha',
                callback: controller.setRePassword,
                obscureText: !controller.isVisiblePassField,
                icon: IconButton(
                  icon: controller.isVisiblePassField
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: controller.changePassFieldVisibility,
                ),
              ),
              StreamBuilder(builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return const Text("Senhas Diferentes");
                } else {
                  return Container();
                }
              }),
              _buildSendButton(),
              _buildLoginOption(),
              _buildDividerButton(),
              const SizedBox(
                height: 15,
              ),
              _buildSocialNetworkButtons(),
            ]),
      );
    });
  }

  Widget _buildSendButton() {
    return Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.13,
        child: DefaultButton(
            widget: const Text(
              "Criar conta",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Theme.of(context).primaryColor,
            callback: controller.isFormValid
                ? () {
                    controller.setSignUpStrategy(RestHttpSignupDataSource());
                    controller.signUp();
                  }
                : null));
  }

  // Function()? sendDataCallback() {
  //   return () async {
  //     controller.isFormValid ? await controller.signUp() : null;
  //   };
  // }

  Widget _buildLoginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Já possui uma conta?"),
        TextButton(onPressed: () {}, child: const Text('login'))
      ],
    );
  }

  Widget _buildDividerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Flexible(
          flex: 1,
          child: Divider(
            height: 10,
          ),
        ),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Ou continuar com'),
            )),
        Flexible(
          flex: 1,
          child: Divider(
            height: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialNetworkButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: _buildSocialNetworkButton(
                "assets/images/google.png", "Google", () async {
          controller.setSignUpStrategy(GoogleSignUpDataSource());
          controller.googleSignUp();
        })),
        Expanded(
          child: _buildSocialNetworkButton(
              "assets/images/facebook.png", "Facebook", () {}),
        ),
      ],
    );
  }

  Widget _buildSocialNetworkButton(
      String logoPath, String name, Function()? callback) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: DefaultButton.socialNetwork(
        widget: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logoPath,
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        callback: callback,
      ),
    );
  }
}
