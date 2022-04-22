import 'package:flutter/material.dart';
import 'package:ohdonto/signv2/widgets/defaul_button_widget.dart';

class SignInSignUpVerifierPage extends StatelessWidget {
  const SignInSignUpVerifierPage({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              const Text("Vamos criar uma conta ?",
                  style: TextStyle(fontSize: 24))
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Verificar ',
            style: TextStyle(fontSize: 45),
          ),
          const Text(
            'Código',
            style: TextStyle(fontSize: 45),
          ),
          const SizedBox(height: 24),
          const Text('Um código foi enviado para'),
          Text('$email'),
          const SizedBox(height: 24),
          _buildRowNumbersField(),
          const SizedBox(height: 24),
          Center(
            child: RichText(
                text: const TextSpan(
                    text: "Não recebi o código. ",
                    children: [TextSpan(text: "Reenviar")])),
          ),
          const SizedBox(height: 24),
          const Center(
              child: DefaultButton(
                  widget: Text(
                    "Enviar código",
                  ),
                  color: Colors.blue))
        ]),
      )),
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
