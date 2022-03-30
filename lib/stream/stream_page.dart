import 'package:flutter/material.dart';
import 'package:ohdonto/stream/stream_page_controller.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  //bool isChecked = false;
  StreamPageController controller = StreamPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder<bool>(
                stream: controller.getCheckboxStream(),
                builder: (context, checkboxSnapshot) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: checkboxSnapshot.data ?? false,
                            onChanged: (userChecked) {
                              controller.getCheckboxSink.add(userChecked!);
                              //print('add sink $userChecked');
                            }),
                        StreamBuilder<String>(
                            stream: controller.nameStream,
                            builder: (context, nameSnapshot) {
                              if (checkboxSnapshot.data ?? false) {
                                return Column(
                                  children: [
                                    TextField(
                                        decoration: const InputDecoration(
                                            label: Text('Nome: ')),
                                        onChanged: (content) {
                                          controller.nameSink.add(content);
                                        }),
                                    Text('> ${nameSnapshot.data ?? ""} <')
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            })
                      ]);
                })));
  }
}
