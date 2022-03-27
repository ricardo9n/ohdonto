import 'package:flutter/material.dart';

class SigInSigUpPage extends StatelessWidget {
  const SigInSigUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      child: const Text('Voltar!'),
      onPressed: () {
        Navigator.pop(context);
      },
    )));
  }
}
