import 'package:flutter/material.dart';

enum Genders { masculino, feminino, nao_informado }

class GenderWidget extends StatefulWidget {
  const GenderWidget({Key? key}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  Genders? _gender;

  void callbackGender(g) {
    setState(() => _gender = g);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RadioListTile<Genders>(
        title: const Text('Masculino'),
        subtitle: const Text('M'),
        value: Genders.masculino,
        groupValue: _gender,
        onChanged: (g) => setState(() => _gender = g),
        visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
      ),
      RadioListTile<Genders>(
        title: const Text('Feminino'),
        value: Genders.feminino,
        groupValue: _gender,
        onChanged: callbackGender,
        visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
      ),
      RadioListTile<Genders>(
        title: const Text('Não Informado'),
        value: Genders.nao_informado,
        groupValue: _gender,
        onChanged: callbackGender,
        visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
      )
    ]);
  }
}
