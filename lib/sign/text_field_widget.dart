import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TextFieldWidget extends StatefulWidget {
  String text;
  String hint;
  ValueStream stream;
  Function(String) callback;

  TextFieldWidget(
      {Key? key,
      required this.text,
      required this.hint,
      required this.stream,
      required this.callback})
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
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                label: Text(widget.text),
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
