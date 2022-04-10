import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String text;
  final String hint;

  final bool obscureText;
  final TextInputType keyboardType;
  //final ValueStream stream;
  final Widget? icon;
  final Function(String) callback;
  final String? errorText;

  const TextFieldWidget(
      {Key? key,
      required this.text,
      required this.hint,
      //required this.stream,
      required this.callback,
      this.errorText,
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
        //    stream: widget.stream.shareValue(),
        builder: (context, snapshot) {
      return TextField(
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          maxLength: 50,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            label: Text(widget.text),
            suffixIcon: widget.icon,
            errorText: widget.errorText,
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
