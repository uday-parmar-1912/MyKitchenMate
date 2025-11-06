import 'package:flutter/material.dart';
import 'package:mykitchenapp/screens/languages.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  void entryPoint(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Languages(goBack: false);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            entryPoint(context);
          },
          child: Image.asset('assets/images/Logo.png'),
        ),
      ),
    );
  }
}
