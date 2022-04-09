import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ohdonto/shared/topbar_backbutton_widget.dart';
import 'package:ohdonto/signv2/sign_in_sign_up_controller.dart';
import 'package:ohdonto/signv2/widgets/defaul_button_widget.dart';

import 'text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignInSignUpController controller;

  @override
  void initState() {
    super.initState();
    controller = SignInSignUpController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBarWidget(),
            _buildCreateAccountText(),
            _buildForm(),
          ],
        ),
      ),
    ));
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
            title: "Criar Conta",
            callback: controller.isFormValid ? controller.signUp1 : null));
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

  Function()? sendDataCallback() {
    return () async {
      controller.isFormValid ? await controller.signUp1() : null;
    };
  }

  Widget _buildDividerButton() {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Expanded(
          child: Divider(
            height: 10,
          ),
        ),
        const Text('Ou continuar com'),
        const Expanded(
          child: Divider(
            height: 10,
          ),
        ),
      ],
    );
  }
}
