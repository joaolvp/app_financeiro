import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController controller = Get.find();
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    controller.teste();
    super.initState();
  }

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
