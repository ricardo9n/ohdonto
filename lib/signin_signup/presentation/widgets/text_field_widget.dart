import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String? hint;

  final bool obscureText;
  final TextInputType inputType;
  //final ValueStream stream;
  final Widget? icon;
  final Function(String)? callback;
  final String? errorText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextAlign? textAlign;
  final int maxLength;
  final double width;

  final Function()? onChanged;

  const TextFieldWidget({
    Key? key,
    required this.label,
    this.hint,
    //required this.stream,
    this.callback,
    this.errorText,
    this.obscureText = false,
    this.icon,
    this.inputType = TextInputType.text,
    this.focusNode,
    this.nextFocusNode,
    this.textAlign,
    this.maxLength = 50,
    this.onChanged,
    required this.width,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        //    stream: widget.stream.shareValue(),
        builder: (context, snapshot) {
      return SizedBox(
        width: widget.width,
        child: TextField(
            obscureText: widget.obscureText,
            keyboardType: widget.inputType,
            maxLength: widget.maxLength,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign ?? TextAlign.left,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              label: Text(widget.label),
              suffixIcon: widget.icon,
              errorText: widget.errorText,
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (content) {
              if (widget.nextFocusNode != null) {
                widget.nextFocusNode?.requestFocus();
              }
              if (widget.callback != null) {
                widget.callback!(content);
              }
            }),
      );
    });
  }
}
