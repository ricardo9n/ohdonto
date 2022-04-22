import 'package:flutter/material.dart';
import 'package:ohdonto/signv2/widgets/defaul_button_widget.dart';

import 'form_based_signup_verification_controller.dart';

class SignInSignUpVerifierPage extends StatefulWidget {
  const SignInSignUpVerifierPage({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  State<SignInSignUpVerifierPage> createState() =>
      _SignInSignUpVerifierPageState();
}

class _SignInSignUpVerifierPageState extends State<SignInSignUpVerifierPage> {
  late FormBasedSignupVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildFirstRow(),
          const SizedBox(height: 24),
          const Text('Verificar ', style: TextStyle(fontSize: 45)),
          const Text('Código', style: TextStyle(fontSize: 45)),
          const SizedBox(height: 24),
          const Text('Um código foi enviado para'),
          Text('${widget.email}'),
          const SizedBox(height: 24),
          _buildRowNumbersField(),
          const SizedBox(height: 24),
          _buildTextoReenviar(),
          const SizedBox(height: 24),
          _buildBotaoEnviarCodigo()
        ]),
      )),
    );
  }

  Center _buildBotaoEnviarCodigo() {
    return const Center(
        child: DefaultButton(
            widget: Text(
              "Enviar código",
            ),
            color: Colors.blue));
  }

  Center _buildTextoReenviar() {
    return Center(
      child: RichText(
          text: const TextSpan(
              text: "Não recebi o código. ",
              children: [TextSpan(text: "Reenviar")])),
    );
  }

  Row _buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        const Text("Vamos criar uma conta ?", style: TextStyle(fontSize: 24))
      ],
    );
  }

  Widget _buildRowNumbersField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNumberField(),
        const SizedBox(width: 12),
        _buildNumberField(),
        const SizedBox(width: 12),
        _buildNumberField(),
        const SizedBox(width: 12),
        _buildNumberField(),
      ],
    );
  }

  Widget _buildNumberField() {
    return SizedBox(
      width: 40,
      child: TextFormField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "*",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void callbackVoltar(context) {
    Navigator.pop(context);
  }
}
