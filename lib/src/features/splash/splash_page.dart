import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorContext = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/financeiro.png',
            width: Get.width,
          ),
          CircularProgressIndicator(
            color: colorContext.tertiary,
          )
        ],
      ),
    );
  }
}
