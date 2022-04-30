import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ohdonto/stream_teste/stream_page_controller_mobx.dart';

class StreamPageMobx extends StatefulWidget {
  const StreamPageMobx({Key? key}) : super(key: key);

  @override
  State<StreamPageMobx> createState() => _StreamPageMobxState();
}

class _StreamPageMobxState extends State<StreamPageMobx> {
  //bool isChecked = false;
  //StreamPageController controller = StreamPageController();

  late FormController formController;

  @override
  void initState() {
    super.initState();
    formController = FormController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Observer(builder: (context) {
      return Column(
        children: [
          Checkbox(
              value: formController.isChecked,
              onChanged: (userChecked) {
                formController.check(userChecked!);
                //print('add sink $userChecked');
              }),
          if (formController.isChecked)
            TextField(
                decoration: const InputDecoration(label: Text('Nome: ')),
                onChanged: (name_) {
                  formController.changeName(name_);
                }),
          if (formController.isChecked) Text('> ${formController.name} <')
        ],
      );
    })));
  }
}
