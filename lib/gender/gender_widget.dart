import 'package:flutter/material.dart';
import 'package:ohdonto/gender/gender_controller_mobx.dart';

import 'genders.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({Key? key}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  late GenderController controller;

  @override
  void initState() {
    super.initState();
    controller = GenderController();
  }

  void changeRadioCallback(g) {
    setState(() {
      controller.setGender(g);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RadioListTile<Genders>(
        title: const Text('Masculino'),
        value: Genders.masculino,
        groupValue: controller.gender(),
        onChanged: changeRadioCallback,
        visualDensity:
            const VisualDensity(vertical: VisualDensity.minimumDensity),
      ),
      RadioListTile<Genders>(
        title: const Text('Feminino'),
        value: Genders.feminino,
        groupValue: controller.gender(),
        onChanged: changeRadioCallback,
        visualDensity:
            const VisualDensity(vertical: VisualDensity.minimumDensity),
      ),
      RadioListTile<Genders>(
        title: const Text('Não Informado'),
        value: Genders.nao_informado,
        groupValue: controller.gender(),
        onChanged: (g) {
          setState(() {
            controller.setGender(g);
          });
        },
        visualDensity:
            const VisualDensity(vertical: VisualDensity.minimumDensity),
      )
    ]);
  }
}
