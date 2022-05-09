import 'package:flutter/material.dart';
import 'package:ohdonto/signin_signup/domain/user_entity.dart';

class MainPage extends StatefulWidget {
  final UserEntity userEntity;
  const MainPage({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // late UserEntity userEntity;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   userEntity = ModalRoute.of(context)?.settings.arguments as UserEntity;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("$widget.userEntity"));
  }
}
