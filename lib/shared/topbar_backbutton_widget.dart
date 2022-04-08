import 'package:flutter/material.dart';

class TopbarBackButtonWidget extends StatelessWidget {
  final Function()? callback;

  const TopbarBackButtonWidget({Key? key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
