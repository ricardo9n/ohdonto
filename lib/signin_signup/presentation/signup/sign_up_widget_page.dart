import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:ohdonto/shared/topbar_backbutton_widget.dart';
import 'package:ohdonto/signin_signup/datasource/rest_http_signup_datasource.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';
import 'package:ohdonto/signin_signup/presentation/routers.dart';
import 'package:ohdonto/signin_signup/presentation/signup/sign_up_controller.dart';
import 'package:ohdonto/signin_signup/presentation/signin_signup_base_page.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/defaul_button_widget.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/social_network_widget.dart';
import 'package:ohdonto/signin_signup/presentation/widgets/title_widget.dart';

import '../widgets/text_field_widget.dart';

class SignUpWidgetPage extends StatefulWidget {
  const SignUpWidgetPage({Key? key}) : super(key: key);

  @override
  State<SignUpWidgetPage> createState() => _SignUpWidgetPageState();
}

class _SignUpWidgetPageState extends State<SignUpWidgetPage> {
  late SignUpController controller;
  late ReactionDisposer errorDisposer;
  late ReactionDisposer successDisposer;

  @override
  void initState() {
    super.initState();
    controller = SignUpController();

    errorDisposer =
        reaction((_) => controller.signUpErrorMessage, signUpErrorHandler);
    successDisposer =
        reaction((_) => controller.userEntity, signUpSuccessHandler);
  }

  void signUpErrorHandler(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message!)),
    );
  }

  void signUpSuccessHandler(UserEntity? userEntity) {
    Navigator.pushNamed(context, toVerificationPage, arguments: userEntity);
  }

  @override
  void dispose() {
    errorDisposer();
    successDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double formWidth = MediaQuery.of(context).size.width;
    return SignInSignUpBasePage(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTopBarWidget(),
            _buildCreateAccountText(),
            _buildForm(formWidth),
          ],
        ),
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
        const TitleWidget(titleList: ["Vamos criar", "uma conta?"]),
        /* const Text('Vamos criar uma conta?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)) */
      ],
    );
  }

  Widget _buildForm(double width) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 13, right: 13, top: 8),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldWidget(
                width: width,
                label: 'Nome',
                hint: 'Digite seu nome',
                onChangedCallback: controller.setName,
                errorText: controller.nameErrorMessage,
                obscureText: false,
              ),
              TextFieldWidget(
                  width: width,
                  label: 'Email',
                  hint: 'Digite seu Email',
                  //          stream: controller.emailStream,
                  onChangedCallback: controller.setEmail,
                  errorText: controller.emailErrorMessage,
                  inputType: TextInputType.emailAddress),
              TextFieldWidget(
                  width: width,
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  onChangedCallback: controller.setPassword,
                  errorText: controller.passwordErrorMsg,
                  obscureText: !controller.isVisiblePassField,
                  icon: IconButton(
                    icon: controller.isVisiblePassField
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: controller.changePassFieldVisibility,
                  )),
              TextFieldWidget(
                width: width,
                label: 'Confirmação de Senha',
                hint: 'Digite novamente sua senha',
                onChangedCallback: controller.setRePassword,
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
              const SizedBox(height: 30),
              _buildSendButton(),
              _buildLoginOption(),
              //_buildDividerButton(),
              // const SizedBox(
              //   height: 15,
              // ),
              // _buildSocialNetworkButtons(),
              const SocialNetworkWidget(),
            ]),
      );
    });
  }

  Widget _buildSendButton() {
    return SizedBox(
        //padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
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

  Widget _buildLoginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Já possui uma conta?"),
        TextButton(onPressed: () {}, child: const Text('login'))
      ],
    );
  }

/*   Widget _buildDividerButton() {
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
 */

/*   Widget _buildSocialNetworkButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: _buildSocialNetworkButton(
                "assets/images/google.png", "Google", () async {
          controller.setSignUpStrategy(GoogleSignUpDataSource());
          // controller.googleSignUp();
        })),
        Expanded(
          child: _buildSocialNetworkButton(
              "assets/images/facebook.png", "Facebook", () {}),
        ),
      ],
    );
  }
 */

/*   Widget _buildSocialNetworkButton(
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
 */

}
