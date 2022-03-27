import 'package:flutter/material.dart';
import 'package:ohdonto/teste/stream_page.dart';

void main() {
  runApp(const OhDontoApp());
}

class OhDontoApp extends StatelessWidget {
  const OhDontoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'oh donto!',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            fontFamily: 'Euclid',
            scaffoldBackgroundColor: Colors.grey.shade100),
        //home: OnBoardingScreenWidget() //const MainPage(),
        home: const StreamPage());
  }
}
