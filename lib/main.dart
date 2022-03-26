import 'package:flutter/material.dart';
import 'app/pages/main_page.dart';
import 'get-start/onboarding-screen.dart';

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
        ),
        home: OnBoardingScreenWidget() //const MainPage(),
        );
  }
}
