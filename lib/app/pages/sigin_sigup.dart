import 'package:flutter/material.dart';

class TesteBotaoVoltarPage extends StatelessWidget {
  const TesteBotaoVoltarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Voltar!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
