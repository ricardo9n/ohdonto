import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Widget widget;
  final Color color;
  final void Function()? callback;

  const DefaultButton({
    Key? key,
    required this.widget,
    required this.color,
    this.callback,
  }) : super(key: key);

  const DefaultButton.socialNetwork({
    Key? key,
    required this.widget,
    this.color = Colors.white,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            primary: color,
            textStyle: const TextStyle(color: Colors.black),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: widget);
  }
}
