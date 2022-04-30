import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final List<String> titleList;

  const TitleWidget({Key? key, required this.titleList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: titleList.map((eachString) => _getText(eachString)).toList(),
    );
  }

  Widget _getText(String content) => Text(
        content,
        style: const TextStyle(fontSize: 45),
      );
}
