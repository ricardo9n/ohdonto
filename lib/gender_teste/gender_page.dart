import 'package:flutter/material.dart';

import 'gender_widget.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GenderWidget());
  }
}
