import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ohdonto/routes.dart';
import 'package:ohdonto/shared/topbar_backbutton_widget.dart';

// ignore: must_be_immutable
class OnboardingPageContent extends StatelessWidget {
  String imagePath;
  String title;
  String description;
  PageController pageController = PageController();
  int pageIndex;
  int pagesLength;

  OnboardingPageContent(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.pageController,
      required this.pageIndex,
      required this.pagesLength})
      : super(key: key);

  late Size pageSize;

  void previusPageCallback() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: (pageIndex > 0)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            if (pageIndex > 0)
              TopbarBackButtonWidget(
                callback: previusPageCallback,
              ),
            _buildSkipText(context),
          ],
        ),
      ),
      Image.asset(
        imagePath,
        width: pageSize.width * 0.65,
        height: pageSize.width * 0.65,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: TextStyle(fontSize: 25, color: Colors.grey.shade600)),
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.grey.shade400,
              ))
        ]),
      ),
      InkWell(
        onTap: () {
          //print('proxima pagina $pageIndex ${pagesLength - 1}');
          if (pageIndex == pagesLength - 1) {
            skip(context);
          }
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: pageSize.width * 0.1,
          height: pageSize.width * 0.1,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          child: const Icon(Icons.forward, color: Colors.white),
        ),
      ),
    ]);
  }

  Widget _buildSkipText(BuildContext context) {
    return TextButton(
      onPressed: () {
        skip(context);
      },
      /* Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TesteBotaoVoltarPage())); */
      child: const Text(
        "Pular",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void skip(context) {
    //Navigator.pushReplacementNamed(context, toGetStarted);
    Modular.to.navigate(toGetStartedPage);
  }
}
