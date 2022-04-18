import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TextFieldWidget extends StatefulWidget {
  final String text;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueStream stream;
  final Icon? icon;
  final Function(String) callback;

  const TextFieldWidget(
      {Key? key,
      required this.text,
      required this.hint,
      required this.stream,
      required this.callback,
      this.obscureText = false,
      this.icon,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream.shareValue(),
        builder: (context, snapshot) {
          return TextField(
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                label: Text(widget.text),
                suffixIcon: widget.icon,
                //hintText: hint,
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (content) {
                widget.callback(content);
              });
        });
  }
}
